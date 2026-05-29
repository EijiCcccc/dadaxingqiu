import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ChatConversationAppBar extends StatelessWidget {
  const ChatConversationAppBar({
    super.key,
    required this.username,
    required this.onMoreTap,
  });

  final String username;
  final VoidCallback onMoreTap;

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      title: username,
      actions: [
        IconButton(
          onPressed: onMoreTap,
          icon: const Icon(Icons.more_horiz, color: AppColors.primaryDark),
        ),
      ],
    );
  }
}

class ChatMoreMenu extends StatelessWidget {
  const ChatMoreMenu({
    super.key,
    required this.onReport,
    required this.onDismiss,
  });

  final VoidCallback onReport;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: onDismiss,
            behavior: HitTestBehavior.opaque,
            child: Container(color: Colors.black26),
          ),
        ),
        Positioned(
          top: MediaQuery.paddingOf(context).top + 56,
          right: 12,
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: onReport,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    child: Text(
                      '举报',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
                Divider(height: 1, color: AppColors.borderGray.withOpacity(0.6)),
                InkWell(
                  onTap: onDismiss,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    child: Text(
                      '取消',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChatReportDialog extends StatefulWidget {
  const ChatReportDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) => const ChatReportDialog(),
    );
  }

  @override
  State<ChatReportDialog> createState() => _ChatReportDialogState();
}

class _ChatReportDialogState extends State<ChatReportDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    AppToast.success('举报成功！');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('举报'),
      content: TextField(
        controller: _controller,
        maxLines: 4,
        decoration: const InputDecoration(
          hintText: '请输入举报内容',
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: _submit,
          child: const Text('提交'),
        ),
      ],
    );
  }
}
