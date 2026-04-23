import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import '../presentation/create_post/create_post_page.dart';
import '../presentation/feed_detail/feed_detail_page.dart';
import '../presentation/notifications/post_notifications_page.dart';

void registerPostRoutes(RouteRegistry registry) {
  const postIdParam = 'postId';

  registry.add(
    GoRoute(
      path: '${RoutePath.feedDetail}/:$postIdParam',
      builder: (context, state) {
        final postId = state.pathParameters[postIdParam] ?? '';
        return FeedDetailPage(postId: postId);
      },
    ),
  );
  registry.add(
    GoRoute(
      path: RoutePath.createPost,
      builder: (_, __) => const CreatePostPage(),
    ),
  );
  registry.add(
    GoRoute(
      path: RoutePath.postNotifications,
      builder: (_, __) => const PostNotificationsPage(),
    ),
  );
}
