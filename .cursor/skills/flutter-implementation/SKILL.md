---
name: flutter-implementation
description: 实现或修改 Flutter 代码时必须遵循：路由、Riverpod、分包隔离、UI 共享组件（见正文）；颜色/core、AppLogger、AppToast、AppDialog。用户要求修改代码、实现功能、新 feature 时启用。
---

# Flutter 实现规范（完整）

> **与 Always 规则的关系**：`.cursor/rules/` 中 `routing-management`、`riverpod-state-management`、`package-data-isolation`、`ui-shared-components` 仅保留**红线摘要**；**细则、示例与目录约定以本文为准**。实现代码前请先阅读本文或对应章节。

## 1. 路由管理

### 1. 禁止直接 Navigator

- **禁止** 使用 `Navigator.push/pop`、`context.go/push`
- **禁止** 提供 `context.go()` 等扩展方法
- **必须** 通过 `GlobalRouter.instance` 统一跳转

```dart
// ❌ 禁止
context.go('/detail/123');
Navigator.push(context, ...);

// ✅ 正确
import 'package:core/core.dart';

GlobalRouter.instance.go(const HomeRoute());
GlobalRouter.instance.push(const DetailRoute(id: '123'));
GlobalRouter.instance.pop();
```

### 2. 路径常量集中管理

- 所有路径定义在 `core/router/route_path.dart`
- **禁止** 在 feature 包内散落路径字符串

```dart
// core/router/route_path.dart
class RoutePath {
  static const String home = '/';
  static const String detail = '/detail';
  static String detailWithId(String id) => '/detail/$id';
}
```

### 3. 类型化路由（AppRoute）

- 在 `core/router/app_route.dart` 定义 sealed class
- 分包通过 `AppRoute` 子类跳转，**不直接引用目标包**

```dart
// core/router/app_route.dart
sealed class AppRoute {
  const AppRoute();
  String get path;
}

final class DetailRoute extends AppRoute {
  const DetailRoute({required this.id}) : super();
  final String id;
  @override
  String get path => RoutePath.detailWithId(id);
}
```

### 4. 分模块自注册

每个 feature 提供 `registerXxxRoutes(RouteRegistry registry)`：

```
feature_xxx/lib/router/
  xxx_routes.dart   # registerXxxRoutes(registry)
```

```dart
// feature_xxx/lib/router/xxx_routes.dart
void registerXxxRoutes(RouteRegistry registry) {
  registry.add(
    GoRoute(
      path: RoutePath.xxx,
      builder: (_, __) => const XxxScreen(),
    ),
  );
}
```

### 5. 新增 feature 流程

1. 在 `core/router/route_path.dart` 添加路径常量
2. 在 `core/router/app_route.dart` 添加 `XxxRoute` 子类
3. 创建 `feature_xxx/lib/router/xxx_routes.dart`，实现 `registerXxxRoutes`
4. 在 `app/router/app_router_config.dart` 添加 `registerXxxRoutes(registry);`

### 6. 依赖关系

- feature 包**只依赖 core**，不依赖其他 feature
- 跳转通过 `AppRoute` 类型，实现分包解耦

## 2. Riverpod 状态管理

### 1. 禁止使用 setState（业务状态）

- **禁止** 用 `setState` 维护**业务 / 页面级**状态（接口数据、列表、需跨 Widget 共享的状态、**表单提交结果**等）
- **必须** 使用 Riverpod 状态流驱动这类 UI 更新
- **允许** 与 Flutter 框架对象强绑定的**纯局部 UI 状态**在 `ConsumerStatefulWidget` 内用 `setState`（例如 `AnimationController`、`Ticker`、仅影响当前 subtree 的过渡），不进入 Repository
- **表单边界**：`TextEditingController`、仅本输入框的校验提示等可留在 Widget；**提交中/提交结果、需与其他区域同步的表单数据**走 Provider

```dart
// ❌ 禁止：业务状态用 setState
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
  int count = 0;
  void increment() => setState(() => count++);  // 禁止
}

// ✅ 正确：使用 ConsumerWidget + ref.watch
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Text('$count');
  }
}
```

### 2. UI 刷新必须通过状态流

- 使用 `ref.watch(provider)` 监听状态，状态变化时自动重建
- **不要在 `build` 里**对会触发重建的 Provider 使用 `ref.read` 作为「订阅」；事件回调中用 `ref.read(provider.notifier)` / `ref.read(provider)` 做单次读取或触发方法（依 Provider 类型而定）
- **副作用**（导航、Toast、Dialog、仅在状态变化时执行一次的操作）用 `ref.listen(provider, ...)`，**不要**在 `build` 里根据 `ref.watch` 的结果写副作用
- **刷新数据**：`ref.invalidate(provider)` 或 `ref.refresh(provider)`

| 方法 | 行为 | 典型场景 |
|------|------|----------|
| `invalidate` | 标记失效，依赖框架在后续 `watch` 时重建；**不返回**新数据 | 按钮「重试」、列表刷新后不强制 await |
| `refresh` | 立即重新执行 Provider，并**返回**本次结果 | `RefreshIndicator.onRefresh` 需 `await` 结束再收起 |

- **`refresh` 的返回值**：对 `FutureProvider`、`AsyncNotifier` 等异步 Provider，常见为 `AsyncValue<T>`；对 `StateProvider`、`Notifier` 等同步类 Provider，返回的是**该 Provider 的状态类型**，不一定是 `AsyncValue`

```dart
// ✅ 下拉刷新（需 await 完成再收起指示器：FutureProvider 用 .future）
RefreshIndicator(
  onRefresh: () => ref.refresh(homeListProvider.future),
  child: ...,
)

// ✅ 按钮触发更新（无需 await）
FilledButton(
  onPressed: () => ref.invalidate(homeListProvider),
  child: const Text('重试'),
)
```

### 3. 异步状态与错误展示

- 异步数据优先用 `AsyncValue`（如 `FutureProvider`、`AsyncNotifier`），在 UI 中用 `when` / `whenData` 或项目统一封装处理 `loading` / `data` / `error`
- 避免在异步分支里用 `setState` 拼 loading/error

### 4. Widget 类型选择

| 场景 | 使用 |
|------|------|
| 无本地状态 | `ConsumerWidget` |
| 有本地状态（如 `TextEditingController`、`AnimationController`） | `ConsumerStatefulWidget` |

即使有本地状态，**数据驱动的 UI 更新**仍通过 `ref.watch`，业务数据不通过 `setState`。

- **`initState` 中禁止使用 `ref`**（含 `read` / `watch` / `listen`）。需要依赖 Provider 时：在 **`Notifier.build()`** 里 `ref.watch` 推导状态，或把一次性逻辑放到 **`WidgetsBinding.instance.addPostFrameCallback`** / 事件回调里再 `ref.read`。

### 5. Feature 包目录结构（按页面/功能划分）

每个 feature 包在 `lib/` 下按页面或子功能划分（与 **分包数据隔离** 规则一致：数据与 Provider 归属本 feature）：

```
packages/feature_xxx/lib/
├── feature_xxx.dart
├── router/           # 路由注册
├── data/             # 模型、Repository
│   ├── models/
│   └── repositories/
├── providers/        # 全 feature 共用或跨页面 Provider（可选）
└── presentation/     # UI 层，按页面/功能划分
    └── xxx/          # 如 home/
        ├── xxx_page.dart
        ├── xxx_state.dart      # 状态模型（Notifier 的 State 类）；**不写** `final xxxProvider`
        └── xxx_providers.dart  # **一个文件至多一个** 顶层 `final xxxProvider`（含 Notifier 实现）
```

- `data/`：Model、Repository，调用 network
- `providers/`：多处复用的 Provider；单页专用的可放在 `presentation/.../xxx_providers.dart`
- `presentation/`：`ConsumerWidget` + `ref.watch`，只依赖本 feature 的 Provider（跨 feature 共享数据见 `package-data-isolation`）
- **State 与 Provider 分文件**：不可变 / 可变 state 类放在 **`xxx_state.dart`**（或 `data`/`models` 下项目既有约定）；**`xxx_providers.dart`** 只放 **Notifier / Provider 声明**。同一子目录下 **`xxx_state.dart` 不得出现 Provider 声明**，**`xxx_providers.dart` 不得定义多个顶层 Provider**。
- **同一文件若需要两个 Provider**：**合并**为同一套 `Notifier` + 单一 `xxxProvider`（或拆到不同子功能目录各一个文件），**禁止**在一个 `*_providers.dart` 里堆叠多个无关 `final` Provider。

### 6. 数据流方向

- **依赖与请求**：`UI` → `ref.watch/read` → `Provider` → `Repository` → `DioClient` + `ApiPath`
- **数据返回**：`Repository` → `Provider` → `UI`（`ref.watch` 触发重建）

```
请求: UI —→ Provider —→ Repository —→ Network
响应: Network —→ Repository —→ Provider —→ UI (ref.watch)
```

- UI 只依赖 Provider，不直接调用 Repository
- 刷新通过 `ref.invalidate` / `ref.refresh` 触发 Provider 重新获取或重建

### 7. family、autoDispose 与代码风格

- **`Provider.family`**：随参数变化的多实例（如用户 id、房间 id）使用 `family`；参数应可作为缓存键（相等性稳定）
- **`autoDispose`**：离开页面或不再被监听时应释放的 Provider 使用 `autoDispose`（与项目现有写法一致）
- **手写 `Provider` / `@riverpod` 代码生成**：以仓库内已有 feature 为准，新代码与邻近文件保持一致

#### 7.1 使用 `NotifierProvider`，不用 `StateNotifierProvider`

- **必须** 使用 Riverpod 2.3+ 推荐的 **`Notifier` / `NotifierProvider`**（异步场景用 **`AsyncNotifier` / `AsyncNotifierProvider`** 等），**禁止** 在新代码中使用已处于维护收尾阶段的 **`StateNotifier` / `StateNotifierProvider`**
- 状态类继承 **`Notifier<T>`**（或带 `autoDispose` 的变体），在 **`build()`** 中返回初始状态，用 **`state = ...`** 或 **`ref`** 更新；与旧 API 对应关系：`StateNotifier` → `Notifier`，`StateNotifierProvider` → `NotifierProvider`
- 存量 `StateNotifier*` 可在修改该文件或该功能时**顺带迁移**为 `Notifier*`，不必为迁移单独开大范围重构

```dart
// ❌ 避免新写
class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void inc() => state++;
}
final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());

// ✅ 新代码优先
class Counter extends Notifier<int> {
  @override
  int build() => 0;
  void inc() => state++;
}
final counterProvider = NotifierProvider<Counter, int>(Counter.new);
```

#### 7.2 Provider 类型选型（不强制「只用 Notifier 系」）

按职责选用，**不必**规定项目中只能使用 `NotifierProvider` 与 `AsyncNotifierProvider`。

| 场景 | 推荐 |
|------|------|
| **可变业务状态**、需要 **命令式方法**（增删改、分页、重试封装等） | **`NotifierProvider` / `AsyncNotifierProvider`**（及 `family`、`autoDispose` 等变体） |
| **只读派生**（`ref.watch` 其他 Provider 后计算出的值，无独立可变 `state`） | **`Provider`** |
| **一次性异步读取**（如单次 `Repository` 调用），无复杂 Notifier API | **`FutureProvider`**（或团队统一写成 `AsyncNotifier`，二选一、与邻近代码一致即可） |
| **流式数据** | **`StreamProvider`**（或 `AsyncNotifier` + `Stream` 订阅，按场景） |
| **极简标量**（如全页「提交中」布尔） | **`StateProvider`** 可接受；新代码也可改用 **`Notifier<bool>`** 以统一风格，非强制 |

- **禁止** 在新代码中使用 **`StateNotifier` / `StateNotifierProvider`**（见 §7.1）
- 与 §4 一致：依赖 Provider 的初始化放在 **`Notifier.build()`** 或首帧/回调，**不在 `initState` 里用 `ref`**

#### 7.3 何时合并为「一个 Provider / 一份 State」

- **状态更新频率高**、**字段之间关联性强**、**单页状态多**、**业务逻辑复杂**时，**优先**用 **一个 `Notifier` + 一份不可变/集中可变 state**（可用 `family` 区分实例），避免同一屏拆成大量细碎 Provider 导致 `watch` 散乱、同步顺序难排。
- 与之相对：**生命周期不同**、需**跨多页复用**、或彼此**独立**的切片，可拆成多个 Provider（见 §6 数据流仍须成立）。

### 8. 其他

- **`ref.listen`**：需要「仅在状态从 A 变为 B 时执行一次」时用 `listen`；是否 `fireImmediately` 按业务需求，避免与 `build` 重复触发副作用
- **测试**：在测试中通过 `ProviderScope` 的 `overrides` 注入假 `Repository` / 假数据，不直接改生产 Provider 实现
- **减少重建（可选）**：列表项或重 Widget 树中，对大范围对象可用 `ref.watch(provider.select((s) => s.field))` 或等价写法，仅在与性能问题相关时引入

## 3. 分包数据隔离

### 1. 禁止跨包调用数据

- **禁止** feature 包 import 其他 feature 包
- **禁止** feature A 的代码 watch/read feature B 的 Provider
- **禁止** feature A 的 Repository 调用 feature B 的 Repository

```dart
// ❌ 禁止：feature_detail 依赖 feature_home
import 'package:feature_home/feature_home.dart';
final item = ref.watch(homeListProvider);  // 跨包消费数据

// ❌ 禁止：feature_detail 调用 feature_home 的 Repository
final repo = ref.read(homeRepositoryProvider);
```

### 2. 每个 package 只提供自己的公共数据

- 各 feature 通过 **导出 Provider** 提供本模块的公共数据
- 其他模块如需该数据，应通过 **core/shared** 提供，或由主项目组合

```dart
// ✅ feature_home 提供自己的数据
// feature_home/lib/feature_home.dart
export 'providers/providers.dart';  // homeListProvider 等

// ✅ feature_detail 自给自足：自己的 Repository + Provider
// feature_detail 需要详情数据时，自己实现 detailRepository + detailProvider
// 不 import feature_home
```

### 3. 跨 feature 共享数据放 core/shared

- 多个 feature 需要同一份数据时，放在 `core` 或 `shared` 包
- 例如：用户信息、全局配置、会话状态

```
core/lib/providers/
  user_provider.dart    # 全局用户，各 feature 可 watch
  dio_client_provider.dart
```

### 4. 依赖关系

| 包 | 可依赖 |
|----|--------|
| feature_xxx | core, shared, network |
| feature_xxx | **禁止** 其他 feature_xxx |

### 5. 数据流原则

```
feature_home:  UI → homeListProvider → HomeRepository → DioClient + ApiPath
feature_detail: UI → detailProvider → DetailRepository → DioClient + ApiPath
```

- 各 feature 独立完成「UI → Provider → Repository → Network」闭环
- 不通过另一 feature 获取数据

## 4. UI 共享组件（底部主按钮与标签）

### 1. 页面底部大主按钮

- **必须**使用 `FullWidthBottomActionBar`（`packages/shared/lib/widgets/full_width_bottom_action_bar.dart`）作为页面底部**全宽主操作**（渐变底 + 圆角主按钮、可选 loading）。
- **禁止**在同类场景手写 `Container`/`DecoratedBox` + `FilledButton` 拼一套与全局不一致的底部主按钮。

```dart
// ❌ 禁止：底部主操作条自行拼 FilledButton
SafeArea(
  child: Padding(
    padding: ...,
    child: FilledButton(...),
  ),
);

// ✅ 正确
import 'package:shared/shared.dart';

FullWidthBottomActionBar(
  label: '提交',
  onPressed: ...,
  loading: isSubmitting,
);
```

- 特例：弹窗内、行内小按钮、非「底部全宽主 CTA」的按钮不受此条约束；**新增页面级底部主 CTA 时优先本组件**。

### 2. 标签：可选中 vs 只读

| 场景 | 组件 |
|------|------|
| 用户可点选、切换选中态（注册选标签、编辑标签、筛选等） | **`SelectableTagChip`** |
| 仅展示、不可切换（卡片、资料展示等） | **`TagPill`** + `TagPillStyle` |

```dart
// ❌ 禁止：可选择场景用 TagPill 或自绘 Chip
// ✅ 可选择
SelectableTagChip(
  label: tag,
  selected: isSelected,
  onTap: () => ...,
);

// ✅ 只读展示
TagPill(label: tag, style: TagPillStyle.profileSection);
```

- 从 `package:shared/shared.dart` 引用上述组件。

## 5. 颜色与常量（core/colors）

- **必须** 将 colors、应用常量放在 `core/colors`（及项目约定的 constants），通过 `core` 统一导出；**禁止**在 feature 内散落硬编码主题色（除非与现有文件一致且后续收敛）。
- 各 feature 引用 `AppColors` 等，不写魔法数字色值（新代码）。

## 6. 日志、Toast、Dialog

- **日志**：`AppLogger`（core），禁止 `print` / `debugPrint` 或随意第三方 logger。
- **Toast**：`AppToast`（shared）。
- **Dialog**：`AppDialog`（shared），底部取消/确定统一 `AppDialog.show`。

## 7. 执行检查清单

1. 路由：`GlobalRouter` + `AppRoute` + `RoutePath`；新增路由按「路径 → AppRoute → registerXxxRoutes → app_router_config」流程。
2. 状态：`ref.watch` / `ref.listen` / `invalidate`·`refresh`；业务数据不进 `setState`；新代码 `Notifier` 系。
3. 分包：无跨 feature import / Provider / Repository；共享数据走 core/shared。
4. UI：底部全宽主 CTA 用 `FullWidthBottomActionBar`；可选中标签 `SelectableTagChip`，只读 `TagPill`。
5. 颜色与工具类：AppColors、AppLogger、AppToast、AppDialog。
