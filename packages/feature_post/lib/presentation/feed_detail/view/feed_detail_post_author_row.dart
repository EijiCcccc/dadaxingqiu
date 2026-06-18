import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

import '../../post_display.dart';

class FeedDetailPostAuthorRow extends StatelessWidget {
  const FeedDetailPostAuthorRow({
    Key? key,
    required this.author,
    required this.createdAt,
  }) : super(key: key);

  final PostAuthorRelation author;
  final int createdAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppNetworkAvatar(
          url: postAuthorAvatar(author),
          radius: 24,
          backgroundColor: AppColors.bgPurple100,
        ),
        const SizedBox(width: 12),
        Expanded(child: _buildAuthorMeta()),
        // if (!author.isFollowing) _buildGreetButton(),
        _buildGreetButton(),
      ],
    );
  }

  Widget _buildAuthorMeta() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              postAuthorName(author),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 8),
            if (postGenderLabel(author.gender).isNotEmpty)
              Text(
                postGenderLabel(author.gender),
                style: TextStyle(
                  color: postGenderColor(author.gender),
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          postTimeAgo(createdAt),
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildGreetButton() {
    return FilledButton.tonal(
      onPressed: () => GlobalRouter.instance.push(
        ChatRoute(userId: author.userId),
      ),
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(76, 36),
      ),
      child: const Text('打招呼'),
    );
  }
}
