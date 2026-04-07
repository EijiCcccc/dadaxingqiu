import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../impl/shared_prefs_storage.dart';
import '../interfaces/key_value_storage.dart';

/// SharedPreferences 实例 Provider
/// 需在 main() 中通过 overrides 注入，例如：
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   final prefs = await SharedPreferences.getInstance();
///   runApp(ProviderScope(
///     overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
///     child: MyApp(),
///   ));
/// }
/// ```
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw StateError(
    'SharedPreferences 未注入，请在 main() 中通过 overrides 注入',
  );
});

/// 键值存储 Provider
final keyValueStorageProvider = Provider<KeyValueStorage>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPrefsStorage(prefs);
});
