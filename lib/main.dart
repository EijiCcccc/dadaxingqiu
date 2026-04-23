import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluwx/fluwx.dart';
import 'package:go_router/go_router.dart';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'router/app_router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. 初始化 SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  // 2. 初始化微信 SDK（需在 core/constants 中配置 wechatAppId）
  if (wechatAppId.isNotEmpty) {
    await Fluwx().registerApi(
      appId: wechatAppId,
      universalLink: wechatUniversalLink,
    );
  }

  // 3. 初始化 DioClient（baseUrl 与《iOS 联调说明》一致）
  final dioClient = DioClient(
    baseUrl:
        'https://supported-queue-dollar-leone.trycloudflare.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );
  dioClient.attachAuthTokenInterceptor(
    () => prefs.getString(StorageKeys.userToken),
  );

  // 4. 路由
  final router = AppRouterConfig.createRouter();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        dioClientProvider.overrideWithValue(dioClient),
      ],
      child: MyApp(router: router),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: router,
    );
  }
}
