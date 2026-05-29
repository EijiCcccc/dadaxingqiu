import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 应用启动后初始化 IM SDK，并在已有登录态时自动登录 IM。
class AppBootstrap extends ConsumerStatefulWidget {
  const AppBootstrap({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<AppBootstrap> createState() => _AppBootstrapState();
}

class _AppBootstrapState extends ConsumerState<AppBootstrap> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrapIm());
  }

  Future<void> _bootstrapIm() async {
    final bridge = ref.read(imAuthBridgeProvider);
    if (bridge == null) return;
    await bridge.init();
    await bridge.tryAutoLogin();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
