const _unset = Object();

class FeedDetailComposerState {
  const FeedDetailComposerState({
    this.replyToCommentId,
    this.replyToNickname,
    this.showEmojiPanel = false,
  });

  final String? replyToCommentId;
  final String? replyToNickname;
  final bool showEmojiPanel;

  FeedDetailComposerState copyWith({
    Object? replyToCommentId = _unset,
    Object? replyToNickname = _unset,
    bool? showEmojiPanel,
  }) {
    return FeedDetailComposerState(
      replyToCommentId: identical(replyToCommentId, _unset)
          ? this.replyToCommentId
          : replyToCommentId as String?,
      replyToNickname: identical(replyToNickname, _unset)
          ? this.replyToNickname
          : replyToNickname as String?,
      showEmojiPanel: showEmojiPanel ?? this.showEmojiPanel,
    );
  }
}
