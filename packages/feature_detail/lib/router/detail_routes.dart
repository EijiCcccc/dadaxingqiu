import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/detail_screen.dart';

/// 详情页路由 - 模块自注册
void registerDetailRoutes(RouteRegistry registry) {
  const paramId = 'id';

  registry.add(
    GoRoute(
      path: '${RoutePath.detail}/:$paramId',
      builder: (context, state) {
        final id = state.pathParameters[paramId] ?? '';
        return DetailScreen(id: id);
      },
    ),
  );
}
