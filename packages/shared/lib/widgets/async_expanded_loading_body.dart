import 'package:flutter/material.dart';

/// [Expanded] + 居中 [CircularProgressIndicator]。
///
/// 放在 [Column] 内、顶栏组件**之下**，顶栏由调用方自行写在 [Column] 外层。
class AsyncExpandedLoadingBody extends StatelessWidget {
  const AsyncExpandedLoadingBody({
    super.key,
    this.indicator = const CircularProgressIndicator(),
  });

  final Widget indicator;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(child: indicator),
    );
  }
}
