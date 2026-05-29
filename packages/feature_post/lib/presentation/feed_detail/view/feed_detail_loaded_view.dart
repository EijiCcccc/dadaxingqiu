import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';
import '../feed_detail_composer_provider.dart';
import '../feed_detail_state.dart';
import 'feed_detail_body_section.dart';
import 'feed_detail_composer_section.dart';
import 'feed_detail_post_header.dart';

class FeedDetailLoadedView extends StatelessWidget {
  const FeedDetailLoadedView({
    super.key,
    required this.postId,
    required this.state,
    required this.controller,
    required this.focusNode,
    required this.emojis,
    required this.onBack,
    required this.onDismissCommentInput,
    required this.onFocusCommentInput,
    required this.onToggleCommentInputMode,
    required this.onAppendEmoji,
    required this.onSendComment,
    required this.onShowMoreActions,
  });

  final String postId;
  final PostDetailState state;
  final TextEditingController controller;
  final FocusNode focusNode;
  final List<String> emojis;
  final VoidCallback onBack;
  final VoidCallback onDismissCommentInput;
  final VoidCallback onFocusCommentInput;
  final VoidCallback onToggleCommentInputMode;
  final ValueChanged<String> onAppendEmoji;
  final Future<void> Function() onSendComment;
  final VoidCallback onShowMoreActions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarWidget(
          title: '动态详情',
          actions: [
            IconButton(
              onPressed: onShowMoreActions,
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ],
          textColor: Colors.black,
          backgroundColor: Colors.white,
          borderColor: AppColors.lineColor,
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: FeedDetailBodySection(
                  postId: postId,
                  state: state,
                  header: FeedDetailPostHeader(post: state.post),
                  onDismissCommentInput: onDismissCommentInput,
                  onFocusCommentInput: onFocusCommentInput,
                ),
              ),
              Consumer(
                builder: (context, ref, _) => FeedDetailComposerSection(
                  composer: ref.watch(feedDetailComposerProvider(postId)),
                  postId: postId,
                  state: state,
                  controller: controller,
                  focusNode: focusNode,
                  emojis: emojis,
                  onFocusCommentInput: onFocusCommentInput,
                  onToggleCommentInputMode: onToggleCommentInputMode,
                  onAppendEmoji: onAppendEmoji,
                  onSendComment: onSendComment,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
