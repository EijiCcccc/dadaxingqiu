import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

import '../../post_display.dart';

class FeedDetailLikeListItem extends StatelessWidget {
  const FeedDetailLikeListItem({
    super.key,
    required this.user,
    required this.onTap,
    required this.onPrimaryAction,
  });

  final PostAuthorRelation user;
  final VoidCallback onTap;
  final VoidCallback onPrimaryAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        children: [
          AppNetworkAvatar(
            url: postAuthorAvatar(user),
            radius: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              postAuthorName(user),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          FilledButton.tonal(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            onPressed: onPrimaryAction,
            child: const Text('私聊感谢'),
          ),
        ],
      ),
    );
  }
}
