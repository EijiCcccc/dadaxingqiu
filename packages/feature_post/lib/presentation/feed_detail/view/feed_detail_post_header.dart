import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

import 'feed_detail_post_author_row.dart';
import 'feed_detail_post_image_grid.dart';

class FeedDetailPostHeader extends StatelessWidget {
  const FeedDetailPostHeader({
    super.key,
    required this.post,
  });

  final PostItem post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedDetailPostAuthorRow(
            author: post.author,
            createdAt: post.createdAt.toInt(),
          ),
          if (post.content.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              post.content,
              style: const TextStyle(
                color: AppColors.textPrimary,
                height: 1.5,
              ),
            ),
          ],
          if (post.images.isNotEmpty) ...[
            const SizedBox(height: 12),
            FeedDetailPostImageGrid(images: post.images),
          ],
        ],
      ),
    );
  }
}
