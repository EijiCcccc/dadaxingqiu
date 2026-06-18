import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ChatRemarkDialog extends StatefulWidget {
  const ChatRemarkDialog({
    super.key,
    required this.initialRemark,
  });

  final String initialRemark;

  static Future<String?> show(
    BuildContext context, {
    required String initialRemark,
  }) {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (_) => ChatRemarkDialog(initialRemark: initialRemark),
    );
  }

  @override
  State<ChatRemarkDialog> createState() => _ChatRemarkDialogState();
}

class _ChatRemarkDialogState extends State<ChatRemarkDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialRemark);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final value = _controller.text.trim();
    if (value.length > 10) {
      AppToast.error('备注最长不超过10个字');
      return;
    }
    Navigator.of(context).pop(value);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('设置备注'),
      content: TextField(
        controller: _controller,
        maxLength: 10,
        decoration: const InputDecoration(
          hintText: '请填写备注，昵称最长不超过10个字',
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
          child: const Text('确定'),
        ),
      ],
    );
  }
}
