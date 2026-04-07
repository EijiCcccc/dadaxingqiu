import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/key_value_storage.dart';

/// SharedPreferences 实现的键值存储
class SharedPrefsStorage implements KeyValueStorage {
  SharedPrefsStorage(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> setString(String key, String value) =>
      _prefs.setString(key, value);

  @override
  Future<String?> getString(String key) async => _prefs.getString(key);

  @override
  Future<void> setInt(String key, int value) => _prefs.setInt(key, value);

  @override
  Future<int?> getInt(String key) async => _prefs.getInt(key);

  @override
  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);

  @override
  Future<bool?> getBool(String key) async => _prefs.getBool(key);

  @override
  Future<void> setDouble(String key, double value) =>
      _prefs.setDouble(key, value);

  @override
  Future<double?> getDouble(String key) async => _prefs.getDouble(key);

  @override
  Future<void> setStringList(String key, List<String> value) =>
      _prefs.setStringList(key, value);

  @override
  Future<List<String>?> getStringList(String key) async =>
      _prefs.getStringList(key);

  @override
  Future<void> remove(String key) => _prefs.remove(key);

  @override
  Future<void> clear() => _prefs.clear();
}
