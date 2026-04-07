import 'package:go_router/go_router.dart';

/// 路由注册表 - 供各 feature 自注册
/// app 层收集后统一构建 GoRouter
class RouteRegistry {
  RouteRegistry();

  final List<RouteBase> _routes = [];

  /// 添加路由
  void add(RouteBase route) {
    _routes.add(route);
  }

  /// 获取已注册的路由（只读）
  List<RouteBase> get routes => List.unmodifiable(_routes);
}
