import 'package:flutter/material.dart';

/// 底部带取消、确定按钮的弹窗
/// 通过 [AppDialog.show] 调用
class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title,
    this.content,
    this.confirmText = '确定',
    this.cancelText = '取消',
    this.onConfirm,
    this.onCancel,
    this.barrierDismissible = true,
  });

  final String? title;
  final Widget? content;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool barrierDismissible;

  /// 显示弹窗
  /// 返回 true 表示点击确定，false 表示点击取消或关闭
  static Future<bool?> show(
    BuildContext context, {
    String? title,
    String? content,
    Widget? contentWidget,
    String confirmText = '确定',
    String cancelText = '取消',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppDialog(
        title: title,
        content: contentWidget ??
            (content != null
                ? Text(
                    content,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  )
                : null),
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        barrierDismissible: barrierDismissible,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: barrierDismissible,
      child: AlertDialog(
        title: title != null ? Text(title!) : null,
        content: content,
        contentPadding: EdgeInsets.fromLTRB(
          24,
          title != null ? 0 : 24,
          24,
          24,
        ),
        actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        actions: [
          TextButton(
            onPressed: () {
              onCancel?.call();
              Navigator.of(context).pop(false);
            },
            child: Text(cancelText),
          ),
          FilledButton(
            onPressed: () {
              onConfirm?.call();
              Navigator.of(context).pop(true);
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }
}
