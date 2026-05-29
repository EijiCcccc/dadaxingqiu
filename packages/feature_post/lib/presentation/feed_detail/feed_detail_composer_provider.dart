import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

import '../post_display.dart';
import 'feed_detail_composer_state.dart';

final feedDetailComposerProvider = NotifierProvider.autoDispose
    .family<FeedDetailComposerNotifier, FeedDetailComposerState, String>(
  () => FeedDetailComposerNotifier(),
);

class FeedDetailComposerNotifier
    extends AutoDisposeFamilyNotifier<FeedDetailComposerState, String> {
  @override
  FeedDetailComposerState build(String arg) {
    return const FeedDetailComposerState();
  }

  void setReplyTarget(PostCommentItem comment) {
    state = state.copyWith(
      replyToCommentId: comment.commentId.toString(),
      replyToNickname: postAuthorName(comment.author),
    );
  }

  void clearReplyTarget() {
    state = state.copyWith(
      replyToCommentId: null,
      replyToNickname: null,
    );
  }

  void showEmojiPanel() {
    state = state.copyWith(showEmojiPanel: true);
  }

  void hideEmojiPanel() {
    state = state.copyWith(showEmojiPanel: false);
  }

  void reset() {
    state = const FeedDetailComposerState();
  }
}
