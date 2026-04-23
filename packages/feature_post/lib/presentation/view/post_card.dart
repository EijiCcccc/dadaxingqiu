import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

import '../post_display.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
    this.onTap,
    this.onLike,
    this.onComment,
    this.onPrimaryAction,
  });

  final PostItem post;
  final VoidCallback? onTap;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onPrimaryAction;

  @override
  Widget build(BuildContext context) {
    final author = post.author;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.borderPurple.withOpacity(0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.bgPurple100,
                  backgroundImage: postAuthorAvatar(author).isNotEmpty
                      ? NetworkImage(postAuthorAvatar(author))
                      : null,
                  child: postAuthorAvatar(author).isEmpty
                      ? const Icon(Icons.person, color: AppColors.textMuted)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              postAuthorName(author),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (postGenderLabel(author.gender).isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: postGenderColor(author.gender)
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                postGenderLabel(author.gender),
                                style: TextStyle(
                                  color: postGenderColor(author.gender),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        postTimeAgo(post.createdAt.toInt()),
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!author.isFollowing)
                  FilledButton.tonal(
                    onPressed: onPrimaryAction,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size(76, 36),
                    ),
                    child: const Text('打招呼'),
                  ),
              ],
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
              _PostImageGrid(images: post.images),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                _ActionButton(
                  icon:
                      post.isLikedByMe ? Icons.favorite : Icons.favorite_border,
                  color: post.isLikedByMe
                      ? Colors.redAccent
                      : AppColors.textSecondary,
                  label: '${post.likeCount}',
                  onTap: onLike,
                ),
                const SizedBox(width: 20),
                _ActionButton(
                  icon: Icons.chat_bubble_outline,
                  color: AppColors.textSecondary,
                  label: '${post.commentCount}',
                  onTap: onComment,
                ),
                // const Spacer(),
                // Text(
                //   postVisibilityLabel(post.visibility),
                //   style: const TextStyle(
                //     color: AppColors.textSecondary,
                //     fontSize: 12,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PostImageGrid extends StatelessWidget {
  const _PostImageGrid({required this.images});

  final List<PostImage> images;

  @override
  Widget build(BuildContext context) {
    final count = images.length;
    final crossAxisCount = count == 1 ? 1 : (count == 2 ? 2 : 3);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: count == 1 ? 1.6 : 1,
      ),
      itemBuilder: (context, index) {
        final image = images[index];
        final imageUrl =
            image.thumbUrl.isNotEmpty ? image.thumbUrl : image.imageUrl;
        return ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            color: AppColors.tagBgGray,
            child: imageUrl.isEmpty
                ? const Icon(Icons.image_outlined)
                : Image.network(imageUrl, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(color: color, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
