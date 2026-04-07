/// API 路径集中管理（与后端 `/api/v1` 对齐）
///
/// 所有接口路径在此定义，禁止在 feature 包内散落路径字符串
class ApiPath {
  ApiPath._();

  // ---------- Auth ----------
  static const String wechatLogin = '/api/v1/auth/wechat/login';
  static const String appleLogin = '/api/v1/auth/apple/login';
  static const String tokenRefresh = '/api/v1/auth/token/refresh';
  static const String logout = '/api/v1/auth/logout';

  // ---------- User / Profile ----------
  static const String usersMe = '/api/v1/users/me';
  static const String usersMeProfile = '/api/v1/users/me/profile';
  static const String usersMeTags = '/api/v1/users/me/tags';
  static const String meSummary = '/api/v1/me/summary';

  // ---------- Tags ----------
  static const String tags = '/api/v1/tags';

  // ---------- Explore ----------
  static const String exploreCards = '/api/v1/explore/cards';

  // ---------- Settings ----------
  static const String settings = '/api/v1/settings';
  static const String settingsVersion = '/api/v1/settings/version';

  // ---------- Feedback ----------
  static const String feedback = '/api/v1/feedback';
}
