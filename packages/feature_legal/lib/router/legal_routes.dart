import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import '../presentation/about/about_page.dart';
import '../presentation/feedback/feedback_page.dart';
import '../presentation/privacy_policy/privacy_policy_page.dart';
import '../presentation/user_agreement/user_agreement_page.dart';

void registerLegalRoutes(RouteRegistry registry) {
  registry.add(
    GoRoute(
      path: RoutePath.about,
      builder: (_, __) => const AboutPage(),
    ),
  );
  registry.add(
    GoRoute(
      path: RoutePath.userAgreement,
      builder: (_, __) => const UserAgreementPage(),
    ),
  );
  registry.add(
    GoRoute(
      path: RoutePath.privacyPolicy,
      builder: (_, __) => const PrivacyPolicyPage(),
    ),
  );
  registry.add(
    GoRoute(
      path: RoutePath.feedback,
      builder: (_, __) => const FeedbackPage(),
    ),
  );
}
