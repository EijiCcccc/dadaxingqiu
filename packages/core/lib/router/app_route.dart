import 'route_path.dart';

/// 类型化路由 - 所有路由定义集中在此
/// 分包通过此类跳转，无需引用目标包
sealed class AppRoute {
  const AppRoute();

  /// 生成实际路径（含参数）
  String get path;
}

/// 详情页
final class DetailRoute extends AppRoute {
  const DetailRoute({required this.id}) : super();

  final String id;

  @override
  String get path => RoutePath.detailWithId(id);
}

/// 登录页
final class LoginRoute extends AppRoute {
  const LoginRoute() : super();

  @override
  String get path => RoutePath.login;
}

/// 完善资料页
final class CompleteProfileRoute extends AppRoute {
  const CompleteProfileRoute() : super();

  @override
  String get path => RoutePath.completeProfile;
}

/// 选择标签页
final class SelectTagsRoute extends AppRoute {
  const SelectTagsRoute() : super();

  @override
  String get path => RoutePath.selectTags;
}

/// 主首页（Tab）
final class MainHomeRoute extends AppRoute {
  const MainHomeRoute() : super();

  @override
  String get path => RoutePath.mainHome;
}

/// 用户资料页
final class UserProfileRoute extends AppRoute {
  const UserProfileRoute({required this.userId}) : super();

  final String userId;

  @override
  String get path => RoutePath.userProfile(userId);
}

/// 聊天页
final class ChatRoute extends AppRoute {
  const ChatRoute({required this.userId}) : super();

  final String userId;

  @override
  String get path => RoutePath.chat(userId);
}

/// 聊天设置页
final class ChatSettingsRoute extends AppRoute {
  const ChatSettingsRoute({required this.userId}) : super();

  final String userId;

  @override
  String get path => RoutePath.chatSettings(userId);
}

/// 动态详情页
final class FeedDetailRoute extends AppRoute {
  const FeedDetailRoute({required this.postId}) : super();

  final String postId;

  @override
  String get path => RoutePath.feedDetailWithId(postId);
}

/// 发布动态页
final class CreatePostRoute extends AppRoute {
  const CreatePostRoute() : super();

  @override
  String get path => RoutePath.createPost;
}

/// 动态消息页
final class PostNotificationsRoute extends AppRoute {
  const PostNotificationsRoute() : super();

  @override
  String get path => RoutePath.postNotifications;
}

/// 编辑资料页
final class EditProfileRoute extends AppRoute {
  const EditProfileRoute() : super();

  @override
  String get path => RoutePath.editProfile;
}

/// 编辑标签页
final class EditTagsRoute extends AppRoute {
  const EditTagsRoute() : super();

  @override
  String get path => RoutePath.editTags;
}

/// 设置页
final class SettingsRoute extends AppRoute {
  const SettingsRoute() : super();

  @override
  String get path => RoutePath.settings;
}

/// 关于页
final class AboutRoute extends AppRoute {
  const AboutRoute() : super();

  @override
  String get path => RoutePath.about;
}

/// 用户协议页
final class UserAgreementRoute extends AppRoute {
  const UserAgreementRoute() : super();

  @override
  String get path => RoutePath.userAgreement;
}

/// 隐私政策页
final class PrivacyPolicyRoute extends AppRoute {
  const PrivacyPolicyRoute() : super();

  @override
  String get path => RoutePath.privacyPolicy;
}

/// 意见反馈页
final class FeedbackRoute extends AppRoute {
  const FeedbackRoute() : super();

  @override
  String get path => RoutePath.feedback;
}

/// 通讯录页
final class ContactRoute extends AppRoute {
  const ContactRoute() : super();

  @override
  String get path => RoutePath.contacts;
}
