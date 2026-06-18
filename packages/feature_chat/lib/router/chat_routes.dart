import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import '../presentation/chat_conversation/chat_conversation_page.dart';
import '../presentation/chat_settings/chat_settings_page.dart';
import '../presentation/contacts/contacts_page.dart';

void registerChatRoutes(RouteRegistry registry) {
  registry.add(
    GoRoute(
      path: RoutePath.contacts,
      builder: (_, __) => const ContactsPage(),
    ),
  );
  registry.add(
    GoRoute(
      path: '/chat/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'] ?? '1';
        return ChatConversationPage(userId: userId);
      },
      routes: [
        GoRoute(
          path: 'settings',
          builder: (context, state) {
            final userId = state.pathParameters['userId'] ?? '1';
            return ChatSettingsPage(userId: userId);
          },
        ),
      ],
    ),
  );
}
