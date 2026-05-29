import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FeedDetailReplyBanner extends StatelessWidget {
  const FeedDetailReplyBanner({
    Key? key,
    required this.nickname,
    required this.onCancel,
  }) : super(key: key);

  final String nickname;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '回复 $nickname',
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          IconButton(
            onPressed: onCancel,
            icon: const Icon(Icons.close, size: 18),
          ),
        ],
      ),
    );
  }
}
