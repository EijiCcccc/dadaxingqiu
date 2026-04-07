import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// 异步数据加载失败时的居中提示与「重试」主按钮。
///
/// 用于 [AsyncValue] 的 `error` 分支，统一文案与主题色。
class AsyncLoadErrorBody extends StatelessWidget {
  const AsyncLoadErrorBody({
    super.key,
    this.message = '加载失败',
    required this.onRetry,
    this.messageStyle,
    this.padding = const EdgeInsets.all(24),
  });

  final String message;
  final VoidCallback onRetry;
  final TextStyle? messageStyle;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: messageStyle ??
                const TextStyle(color: AppColors.primaryDark),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: onRetry,
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }
}
