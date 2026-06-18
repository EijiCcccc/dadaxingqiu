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

  /// 获取指定用户摘要
  static String userSummary(String userId) => '/api/v1/users/$userId/summary';

  /// 获取头像上传 Token
  static const String usersMeAvatarUploadToken = '/api/v1/users/me/avatar/upload-token';

  // ---------- Tags ----------
  static const String tags = '/api/v1/tags';

  // ---------- Explore ----------
  static const String exploreCards = '/api/v1/explore/cards';

  // ---------- Posts ----------
  static const String friendPosts = '/api/v1/posts/friends';
  static const String squarePosts = '/api/v1/posts/square';
  static const String posts = '/api/v1/posts';
  static const String postImageUploadToken =
      '/api/v1/posts/image/upload-token';
  static const String likePost = '/api/v1/posts/like';
  static const String unlikePost = '/api/v1/posts/unlike';
  static const String postCommentsCreate = '/api/v1/posts/comments';
  static const String postCommentsReply = '/api/v1/posts/comments/reply';
  static const String postCommentsDelete = '/api/v1/posts/comments/delete';
  static const String postDelete = '/api/v1/posts/delete';
  static const String postVisibility = '/api/v1/posts/visibility';
  static const String postNotifications = '/api/v1/posts/notifications';
  static const String postNotificationsUnread =
      '/api/v1/posts/notifications/unread';
  static const String postNotificationsRead =
      '/api/v1/posts/notifications/read';

  static String postDetail(String postId) => '/api/v1/posts/$postId';

  static String postComments(String postId) =>
      '/api/v1/posts/$postId/comments';

  static String postLikes(String postId) => '/api/v1/posts/$postId/likes';

  // ---------- Follow ----------
  static const String follows = '/api/v1/follows';
  static const String unfollowUser = '/api/v1/follows/delete';

  // ---------- Settings ----------
  static const String settings = '/api/v1/settings';
  static const String settingsVersion = '/api/v1/settings/version';

  // ---------- Feedback ----------
  static const String feedback = '/api/v1/feedback';

  // ---------- IM ----------
  static const String imSession = '/api/v1/im/session';

  /// 获取与指定用户的亲密度详情
  static String imIntimacy(String peerUserId) =>
      '/api/v1/im/intimacy/$peerUserId';

  /// 批量获取会话补充信息
  static const String imConversationMeta = '/api/v1/im/conversations/meta';

  // ---------- Chat Settings ----------
  static String chatSettings(String peerUserId) =>
      '/api/v1/chats/$peerUserId/settings';

  static String chatPin(String peerUserId) =>
      '/api/v1/chats/$peerUserId/pin';

  static String userRemark(String targetUserId) =>
      '/api/v1/users/$targetUserId/remark';

  static String chatBackgroundUploadToken(String peerUserId) =>
      '/api/v1/chats/$peerUserId/background/upload-token';

  static String chatBackground(String peerUserId) =>
      '/api/v1/chats/$peerUserId/background';

  static String chatDelete(String peerUserId) =>
      '/api/v1/chats/$peerUserId/delete';

  // ---------- Contacts ----------
  static const String contactFriends = '/api/v1/contacts/friends';
  static const String contactFollowing = '/api/v1/contacts/following';
  static const String contactFollowers = '/api/v1/contacts/followers';
}
