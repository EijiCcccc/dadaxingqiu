import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import '../presentation/shell/main_home_page.dart';

/// 主工程壳路由：主首页 Tab 容器
void registerMainRoutes(RouteRegistry registry) {
  registry.add(
    GoRoute(
      path: RoutePath.mainHome,
      builder: (_, __) => const MainHomePage(),
    ),
  );
}
