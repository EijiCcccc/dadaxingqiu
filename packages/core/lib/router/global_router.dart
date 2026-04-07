import 'package:go_router/go_router.dart';

import 'app_route.dart';

/// 全局路由 - 统一跳转入口
/// 禁止直接 Navigator，禁止 context 扩展
/// 分包通过 GlobalRouter 跳转，实现分包解耦
class GlobalRouter {
  GlobalRouter._();

  static GlobalRouter? _instance;
  static GoRouter? _goRouter;

  /// 单例
  static GlobalRouter get instance {
    final i = _instance;
    if (i == null) {
      throw StateError(
        'GlobalRouter 未初始化，请在 main() 中调用 GlobalRouter.init(goRouter)',
      );
    }
    return i;
  }

  /// 初始化（app 层在创建 GoRouter 后调用）
  static void init(GoRouter goRouter) {
    _goRouter = goRouter;
    _instance ??= GlobalRouter._();
  }

  GoRouter get _router {
    final r = _goRouter;
    if (r == null) {
      throw StateError('GoRouter 未注入');
    }
    return r;
  }

  /// 替换当前栈（go）
  void go(AppRoute route) {
    _router.go(route.path);
  }

  /// 压栈（push）
  void push(AppRoute route) {
    _router.push(route.path);
  }

  /// 替换当前页
  void pushReplacement(AppRoute route) {
    _router.pushReplacement(route.path);
  }

  /// 出栈
  void pop<T>([T? result]) {
    _router.pop(result);
  }

  /// 是否可 pop
  bool canPop() => _router.canPop();
}
