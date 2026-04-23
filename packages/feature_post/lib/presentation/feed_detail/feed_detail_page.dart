import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

import '../post_display.dart';
import 'feed_detail_provider.dart';

class FeedDetailPage extends ConsumerStatefulWidget {
  const FeedDetailPage({super.key, required this.postId});

  final String postId;

  @override
  ConsumerState<FeedDetailPage> createState() => _FeedDetailPageState();
}

class _FeedDetailPageState extends ConsumerState<FeedDetailPage> {
  static const _commentEmojis = [
    '😀',
    '😁',
    '😂',
    '🤣',
    '😊',
    '😍',
    '😘',
    '🥰',
    '😎',
    '🤔',
    '😭',
    '😡',
    '👍',
    '👏',
    '🙏',
    '🎉',
  ];

  final _controller = TextEditingController();
  final _commentFocusNode = FocusNode();
  String? _replyToCommentId;
  String? _replyToNickname;
  bool _showEmojiPanel = false;

  bool get _isCommentBarExpanded =>
      _commentFocusNode.hasFocus || _showEmojiPanel;

  @override
  void initState() {
    super.initState();
    _commentFocusNode.addListener(_handleCommentFocusChange);
  }

  void _handleCommentFocusChange() {
    if (!mounted) return;
    setState(() {});
  }

  void _focusCommentInput() {
    if (_showEmojiPanel) {
      setState(() {
        _showEmojiPanel = false;
      });
    }
    _commentFocusNode.requestFocus();
  }

  void _dismissCommentInput() {
    if (_showEmojiPanel || _commentFocusNode.hasFocus) {
      setState(() {
        _showEmojiPanel = false;
      });
    }
    _commentFocusNode.unfocus();
  }

  void _toggleCommentInputMode() {
    if (_showEmojiPanel) {
      _commentFocusNode.requestFocus();
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          _showEmojiPanel = false;
        });
      });
      return;
    }
    _commentFocusNode.unfocus();
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          _showEmojiPanel = true;
        });
      });
  }

  void _appendEmoji(String emoji) {
    final value = _controller.value;
    final selection = value.selection;
    final start = selection.isValid ? selection.start : value.text.length;
    final end = selection.isValid ? selection.end : value.text.length;
    final newText = value.text.replaceRange(start, end, emoji);
    final cursorOffset = start + emoji.length;
    _controller.value = value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorOffset),
      composing: TextRange.empty,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _commentFocusNode.removeListener(_handleCommentFocusChange);
    _commentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(feedDetailProvider(widget.postId));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GradientBackgroundWidget(
          child: SafeArea(
            top: false,
            child: asyncValue.when(
              data: (state) => Column(
                children: [
                  _DetailAppBar(
                    onBack: () => GlobalRouter.instance.pop(),
                    onMore: () => _showMoreActions(state),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () => ref
                                .read(
                                    feedDetailProvider(widget.postId).notifier)
                                .refresh(),
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: _dismissCommentInput,
                              child: NotificationListener<ScrollNotification>(
                                onNotification: (notification) {
                                  if (notification is ScrollStartNotification ||
                                      notification
                                          is ScrollUpdateNotification ||
                                      notification is UserScrollNotification) {
                                    _dismissCommentInput();
                                  }
                                  return false;
                                },
                                child: NestedScrollView(
                                  headerSliverBuilder: (_, __) => [
                                    SliverToBoxAdapter(
                                      child: _PostHeader(
                                        post: state.post,
                                        onFollowTap: () => ref
                                            .read(feedDetailProvider(
                                                    widget.postId)
                                                .notifier)
                                            .toggleFollowUser(
                                              state.post.author.userId
                                                  .toString(),
                                            ),
                                      ),
                                    ),
                                    const SliverPersistentHeader(
                                      pinned: true,
                                      delegate: _TabBarDelegate(
                                        TabBar(
                                          dividerColor: Colors.transparent,
                                          tabs: [
                                            Tab(text: '评论'),
                                            Tab(text: '点赞'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  body: TabBarView(
                                    children: [
                                      _CommentList(
                                        comments: state.comments,
                                        onListTap: _dismissCommentInput,
                                        onReply: (comment) {
                                          setState(() {
                                            _replyToCommentId =
                                                comment.commentId.toString();
                                            _replyToNickname =
                                                postAuthorName(comment.author);
                                          });
                                        },
                                        onDelete: (comment) => ref
                                            .read(feedDetailProvider(
                                                    widget.postId)
                                                .notifier)
                                            .deleteComment(
                                                comment.commentId.toString()),
                                      ),
                                      _LikeList(
                                        likes: state.likes,
                                        onListTap: _dismissCommentInput,
                                        onPrimaryAction: (user) {
                                          if (user.isFollowing) {
                                            GlobalRouter.instance.push(
                                              ChatRoute(
                                                  userId:
                                                      user.userId.toString()),
                                            );
                                            return;
                                          }
                                          ref
                                              .read(feedDetailProvider(
                                                      widget.postId)
                                                  .notifier)
                                              .toggleFollowUser(
                                                  user.userId.toString());
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        _CommentBar(
                          controller: _controller,
                          focusNode: _commentFocusNode,
                          replyToNickname: _replyToNickname,
                          isExpanded: _isCommentBarExpanded,
                          showEmojiPanel: _showEmojiPanel,
                          emojis: _commentEmojis,
                          likeCount: state.post.likeCount.toString(),
                          commentCount: state.post.commentCount.toString(),
                          liked: state.post.isLikedByMe,
                          isSending: state.isSendingComment,
                          onCancelReply: () {
                            setState(() {
                              _replyToCommentId = null;
                              _replyToNickname = null;
                            });
                          },
                          onLikeTap: () => ref
                              .read(feedDetailProvider(widget.postId).notifier)
                              .toggleLike(),
                          onEmojiToggle: _toggleCommentInputMode,
                          onEmojiSelected: _appendEmoji,
                          onSend: () async {
                            final text = _controller.text.trim();
                            if (text.isEmpty) return;
                            await ref
                                .read(
                                    feedDetailProvider(widget.postId).notifier)
                                .submitComment(
                                  content: text,
                                  replyToCommentId: _replyToCommentId,
                                );
                            _controller.clear();
                            if (mounted) {
                              setState(() {
                                _replyToCommentId = null;
                                _replyToNickname = null;
                                _showEmojiPanel = false;
                              });
                            }
                            _commentFocusNode.unfocus();
                          },
                          onCommentTap: _focusCommentInput,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: AsyncLoadErrorBody(
                  message: '动态详情加载失败：$error',
                  onRetry: () =>
                      ref.invalidate(feedDetailProvider(widget.postId)),
                  padding: const EdgeInsets.all(24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMoreActions(PostDetailState state) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final option in const [
              (PostVisibility.PUBLIC, '所有人可见'),
              (PostVisibility.FRIENDS_ONLY, '仅好友可见'),
              (PostVisibility.SQUARE_ONLY, '仅广场可见'),
              (PostVisibility.SELF_ONLY, '仅自己可见'),
            ])
              ListTile(
                title: Text(option.$2),
                trailing: state.post.visibility == option.$1
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  ref
                      .read(feedDetailProvider(widget.postId).notifier)
                      .updateVisibility(
                        option.$1,
                      );
                  Navigator.of(context).pop();
                },
              ),
            ListTile(
              title: const Text(
                '删除动态',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () async {
                Navigator.of(context).pop();
                final success = await ref
                    .read(feedDetailProvider(widget.postId).notifier)
                    .deletePost();
                if (!mounted || !success) return;
                GlobalRouter.instance.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailAppBar extends StatelessWidget {
  const _DetailAppBar({
    required this.onBack,
    required this.onMore,
  });

  final VoidCallback onBack;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.bgPurple100.withOpacity(0.85),
        border: Border(
          bottom: BorderSide(color: AppColors.borderPurple.withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryDark),
          ),
          const Expanded(
            child: Text(
              '动态详情',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: onMore,
            icon: const Icon(Icons.more_vert, color: AppColors.primaryDark),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({
    required this.post,
    required this.onFollowTap,
  });

  final PostItem post;
  final VoidCallback onFollowTap;

  @override
  Widget build(BuildContext context) {
    final author = post.author;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
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
                    ? const Icon(Icons.person)
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
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
                  onPressed: () => GlobalRouter.instance.push(
                    ChatRoute(userId: author.userId.toString()),
                  ),
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: post.images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final image = post.images[index];
                final imageUrl =
                    image.thumbUrl.isNotEmpty ? image.thumbUrl : image.imageUrl;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

class _CommentList extends StatelessWidget {
  const _CommentList({
    required this.comments,
    required this.onListTap,
    required this.onReply,
    required this.onDelete,
  });

  final List<PostCommentItem> comments;
  final VoidCallback onListTap;
  final ValueChanged<PostCommentItem> onReply;
  final ValueChanged<PostCommentItem> onDelete;

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onListTap,
        child: const Center(child: Text('还没有评论，来抢沙发吧')),
      );
    }
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      itemBuilder: (context, index) {
        final comment = comments[index];
        return InkWell(
          onTap: () {
            onListTap();
            onReply(comment);
          },
          onLongPress: () => onDelete(comment),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: postAuthorAvatar(comment.author).isNotEmpty
                    ? NetworkImage(postAuthorAvatar(comment.author))
                    : null,
                child: postAuthorAvatar(comment.author).isEmpty
                    ? const Icon(Icons.person, size: 18)
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postAuthorName(comment.author),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      comment.replyToUserId > 0
                          ? '回复 ${comment.author.nickname}: ${comment.content}'
                          : comment.content,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      postTimeAgo(comment.createdAt.toInt()),
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(
        height: 24,
        color: Colors.transparent,
      ),
      itemCount: comments.length,
    );
  }
}

class _LikeList extends StatelessWidget {
  const _LikeList({
    required this.likes,
    required this.onListTap,
    required this.onPrimaryAction,
  });

  final List<PostAuthorRelation> likes;
  final VoidCallback onListTap;
  final ValueChanged<PostAuthorRelation> onPrimaryAction;

  @override
  Widget build(BuildContext context) {
    if (likes.isEmpty) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onListTap,
        child: const Center(child: Text('还没有人点赞')),
      );
    }
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      itemBuilder: (context, index) {
        final user = likes[index];
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onListTap,
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: postAuthorAvatar(user).isNotEmpty
                    ? NetworkImage(postAuthorAvatar(user))
                    : null,
                child: postAuthorAvatar(user).isEmpty
                    ? const Icon(Icons.person)
                    : null,
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
                onPressed: () {
                  onListTap();
                  onPrimaryAction(user);
                },
                child: const Text('私聊感谢'),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) =>
          const Divider(height: 24, color: Colors.transparent),
      itemCount: likes.length,
    );
  }
}

class _CommentBar extends StatelessWidget {
  const _CommentBar({
    required this.controller,
    required this.focusNode,
    required this.replyToNickname,
    required this.isExpanded,
    required this.showEmojiPanel,
    required this.emojis,
    required this.likeCount,
    required this.commentCount,
    required this.liked,
    required this.isSending,
    required this.onCancelReply,
    required this.onLikeTap,
    required this.onCommentTap,
    required this.onEmojiToggle,
    required this.onEmojiSelected,
    required this.onSend,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? replyToNickname;
  final bool isExpanded;
  final bool showEmojiPanel;
  final List<String> emojis;
  final String likeCount;
  final String commentCount;
  final bool liked;
  final bool isSending;
  final VoidCallback onCancelReply;
  final VoidCallback onLikeTap;
  final VoidCallback onSend;
  final VoidCallback onCommentTap;
  final VoidCallback onEmojiToggle;
  final ValueChanged<String> onEmojiSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        border: Border(
          top: BorderSide(color: AppColors.borderPurple.withOpacity(0.5)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (replyToNickname != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '回复 $replyToNickname',
                      style: const TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                  IconButton(
                    onPressed: onCancelReply,
                    icon: const Icon(Icons.close, size: 18),
                  ),
                ],
              ),
            ),
          Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      controller: controller,
                      focusNode: focusNode,
                      style: const TextStyle(color: Colors.black),
                      onTap: onCommentTap,
                      onTapOutside: (_) => focusNode.unfocus(),
                      decoration: InputDecoration(
                        hintText: replyToNickname == null ? '说点什么...' : '回复内容',
                        hintStyle: const TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: AppColors.tagBgGray,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(999),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: InkWell(
                        onTap: onEmojiToggle,
                        child: Icon(
                          showEmojiPanel
                              ? Icons.keyboard_alt_outlined
                              : Icons.emoji_emotions_outlined,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: isSending ? null : onSend,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(76, 36),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: AppColors.primary.withOpacity(0.5), 
                ),
                child: isSending
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Text('发送'),
              ),
              if (!isExpanded) ...[
                const SizedBox(width: 8),
                InkWell(
                  onTap: onLikeTap,
                  child: Row(
                    children: [
                      Icon(
                        liked ? Icons.favorite : Icons.favorite_border,
                        color:
                            liked ? Colors.redAccent : AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(likeCount),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: onCommentTap,
                  child: Row(
                    children: [
                      const Icon(Icons.mode_comment_outlined,
                          color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text(commentCount),
                    ],
                  ),
                ),
              ],
            ],
          ),
          if (showEmojiPanel) ...[
            const SizedBox(height: 12),
            SizedBox(
              height: 168,
              child: GridView.builder(
                itemCount: emojis.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final emoji = emojis[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => onEmojiSelected(emoji),
                    child: Center(
                      child: Text(
                        emoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  const _TabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white.withOpacity(0.92),
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) {
    return oldDelegate.tabBar != tabBar;
  }
}
