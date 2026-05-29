import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../feed_detail_composer_provider.dart';
import '../feed_detail_composer_state.dart';
import '../feed_detail_provider.dart';
import '../feed_detail_state.dart';
import 'feed_detail_comment_bar.dart';

class FeedDetailComposerSection extends ConsumerWidget {
  const FeedDetailComposerSection({
    Key? key,
    required this.composer,
    required this.postId,
    required this.state,
    required this.controller,
    required this.focusNode,
    required this.emojis,
    required this.onFocusCommentInput,
    required this.onToggleCommentInputMode,
    required this.onAppendEmoji,
    required this.onSendComment,
  }) : super(key: key);

  final FeedDetailComposerState composer;
  final String postId;
  final PostDetailState state;
  final TextEditingController controller;
  final FocusNode focusNode;
  final List<String> emojis;
  final VoidCallback onFocusCommentInput;
  final VoidCallback onToggleCommentInputMode;
  final ValueChanged<String> onAppendEmoji;
  final Future<void> Function() onSendComment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailNotifier = ref.read(feedDetailProvider(postId).notifier);
    final composerNotifier =
        ref.read(feedDetailComposerProvider(postId).notifier);
    return ListenableBuilder(
      listenable: focusNode,
      builder: (context, _) => FeedDetailCommentBar(
        controller: controller,
        focusNode: focusNode,
        replyToNickname: composer.replyToNickname,
        isExpanded: focusNode.hasFocus || composer.showEmojiPanel,
        showEmojiPanel: composer.showEmojiPanel,
        emojis: emojis,
        likeCount: state.post.likeCount.toString(),
        commentCount: state.post.commentCount.toString(),
        liked: state.post.isLikedByMe,
        isSending: state.isSendingComment,
        onCancelReply: composerNotifier.clearReplyTarget,
        onLikeTap: detailNotifier.toggleLike,
        onCommentTap: onFocusCommentInput,
        onEmojiToggle: onToggleCommentInputMode,
        onEmojiSelected: onAppendEmoji,
        onSend: onSendComment,
      ),
    );
  }
}
