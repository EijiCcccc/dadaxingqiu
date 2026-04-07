import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import '../presentation/complete_profile/complete_profile_page.dart';
import '../presentation/login/login_page.dart';
import '../presentation/select_tags/select_tags_page.dart';

/// 认证模块路由 - 模块自注册
void registerAuthRoutes(RouteRegistry registry) {
  registry.add(
    GoRoute(
      path: RoutePath.login,
      builder: (_, __) => const LoginPage(),
    ),
  );
  registry.add(
    GoRoute(
      path: RoutePath.completeProfile,
      builder: (_, __) => const CompleteProfilePage(),
    ),
  );
  registry.add(
    GoRoute(
      path: RoutePath.selectTags,
      builder: (_, __) => const SelectTagsPage(),
    ),
  );
}
