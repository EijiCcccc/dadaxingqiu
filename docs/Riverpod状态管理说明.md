# Riverpod 状态管理说明

## 1. 已完成的集成

- 根项目、core、feature_home、feature_detail 已添加 `flutter_riverpod: ^2.6.1`
- `main.dart` 已用 `ProviderScope` 包裹整个应用

## 2. 基本用法

### 2.1 定义 Provider

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 简单 Provider
final counterProvider = StateProvider<int>((ref) => 0);

// 异步 Provider
final userProvider = FutureProvider<User>((ref) async {
  return fetchUser();
});

// 带参数的 Provider
final itemProvider = Provider.family<Item, String>((ref, id) {
  return Item(id: id);
});
```

### 2.2 在 Widget 中使用

```dart
// 使用 ConsumerWidget（替代 StatelessWidget）
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Text('$count');
  }
}

// 使用 ConsumerStatefulWidget（替代 StatefulWidget）
class MyStatefulWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends ConsumerState<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    return Text('$count');
  }
}
```

### 2.3 常用 API

| API | 说明 |
|-----|------|
| `ref.watch(provider)` | 监听并重建 |
| `ref.read(provider)` | 单次读取（事件回调中） |
| `ref.listen(provider, (prev, next) {})` | 监听变化并执行回调 |
| `ref.invalidate(provider)` | 使 Provider 失效并重建 |

## 3. 项目中的放置建议

| 位置 | 用途 |
|------|------|
| `packages/core/lib/providers/` | 全局 Provider（主题、路由、用户等） |
| `packages/feature_xxx/lib/providers/` | 功能模块内 Provider |

## 4. 与 go_router 配合

如需在路由中访问 Provider，可使用 `GoRouter` 的 `refreshListenable` 或通过 `ProviderScope.containerOf(context)` 获取 `Ref`。
