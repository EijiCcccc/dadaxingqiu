import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import '../presentation/chat_conversation/chat_conversation_page.dart';

void registerChatRoutes(RouteRegistry registry) {
  registry.add(
    GoRoute(
      path: '/chat/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'] ?? '1';
        return ChatConversationPage(userId: userId);
      },
    ),
  );
}
