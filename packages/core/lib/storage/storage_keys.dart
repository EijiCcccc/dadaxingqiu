/// 存储键常量，统一命名空间，避免冲突
abstract final class StorageKeys {
  StorageKeys._();

  static const String _prefix = 'app';

  /// 主题模式：light / dark / system
  static String get themeMode => '$_prefix:config:theme';

  /// 语言/地区
  static String get locale => '$_prefix:config:locale';

  /// 用户 ID
  static String get userId => '$_prefix:user:id';

  /// 用户 Token（敏感数据建议用 SecureStorage）
  static String get userToken => '$_prefix:user:token';

  /// 刷新 Token
  static String get refreshToken => '$_prefix:user:refresh_token';
}
