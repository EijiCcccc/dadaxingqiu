/// 路径常量集中管理
/// 禁止在包内散落路径字符串
class RoutePath {
  RoutePath._();

  /// 主首页（搭搭星球 Tab 页）
  static const String mainHome = '/home';

  /// 详情页
  static const String detail = '/detail';

  /// 详情页路径模板（带参数）
  static String detailWithId(String id) => '/detail/$id';

  /// 登录页
  static const String login = '/login';

  /// 完善资料页
  static const String completeProfile = '/complete-profile';

  /// 选择标签页
  static const String selectTags = '/select-tags';

  /// 用户资料页（带 userId）
  static String userProfile(String userId) => '/user/$userId';

  /// 聊天页（带 userId）
  static String chat(String userId) => '/chat/$userId';

  /// 动态详情页（带 postId）
  static const String feedDetail = '/feed';
  static String feedDetailWithId(String postId) => '$feedDetail/$postId';

  /// 发布动态页
  static const String createPost = '/posts/create';

  /// 动态消息页
  static const String postNotifications = '/posts/notifications';

  /// 编辑资料页
  static const String editProfile = '/edit-profile';

  /// 编辑标签页
  static const String editTags = '/edit-tags';

  /// 设置页
  static const String settings = '/settings';

  /// 关于页
  static const String about = '/about';

  /// 用户协议页
  static const String userAgreement = '/user-agreement';

  /// 隐私政策页
  static const String privacyPolicy = '/privacy-policy';

  /// 意见反馈页
  static const String feedback = '/feedback';
}
