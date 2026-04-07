import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import '../presentation/edit_profile/edit_profile_page.dart';
import '../presentation/edit_tags/edit_tags_page.dart';
import '../presentation/settings/settings_page.dart';
import '../presentation/user_profile/user_profile_page.dart';

void registerProfileRoutes(RouteRegistry registry) {
  registry.add(
    GoRoute(
      path: '/user/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'] ?? '1';
        return UserProfilePage(userId: userId);
      },
    ),
  );
  registry.add(
    GoRoute(
      path: RoutePath.editProfile,
      builder: (_, __) => const EditProfilePage(),
    ),
  );
  registry.add(
    GoRoute(
      path: RoutePath.editTags,
      builder: (_, __) => const EditTagsPage(),
    ),
  );
  registry.add(
    GoRoute(
      path: RoutePath.settings,
      builder: (_, __) => const SettingsPage(),
    ),
  );
}
