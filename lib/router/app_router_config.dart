import 'package:core/core.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_chat/feature_chat.dart';
import 'package:feature_detail/feature_detail.dart';
import 'package:feature_legal/feature_legal.dart';
import 'package:feature_post/feature_post.dart';
import 'package:feature_profile/feature_profile.dart';
import 'package:go_router/go_router.dart';

import 'main_routes.dart';

/// 路由配置 - 收集各 feature 自注册的路由
/// 新增 feature 时：添加 import + 一行 registerXxxRoutes(registry)
class AppRouterConfig {
  AppRouterConfig._();

  static GoRouter createRouter() {
    final registry = RouteRegistry();

    registerAuthRoutes(registry);
    registerMainRoutes(registry);
    registerProfileRoutes(registry);
    registerChatRoutes(registry);
    registerLegalRoutes(registry);
    registerDetailRoutes(registry);
    registerPostRoutes(registry);

    final router = GoRouter(
      initialLocation: RoutePath.login,
      routes: registry.routes,
    );

    GlobalRouter.init(router);
    return router;
  }
}
