import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

import 'feed_detail_composer_provider.dart';
import 'feed_detail_provider.dart';
import 'feed_detail_state.dart';
import 'view/feed_detail_loaded_view.dart';
import 'view/feed_detail_more_actions_sheet.dart';

class FeedDetailPage extends ConsumerStatefulWidget {
  const FeedDetailPage({
    super.key,
    required this.postId,
  });

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

  FeedDetailComposerNotifier get _composerNotifier =>
      ref.read(feedDetailComposerProvider(widget.postId).notifier);

  FeedDetailNotifier get _detailNotifier =>
      ref.read(feedDetailProvider(widget.postId).notifier);

  @override
  void dispose() {
    _controller.dispose();
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
          colors: const [Colors.white, Colors.white],
          child: SafeArea(
            top: false,
            child: asyncValue.when(
              data: (state) => FeedDetailLoadedView(
                postId: widget.postId,
                state: state,
                controller: _controller,
                focusNode: _commentFocusNode,
                emojis: _commentEmojis,
                onBack: _handleBack,
                onDismissCommentInput: _dismissCommentInput,
                onFocusCommentInput: _focusCommentInput,
                onToggleCommentInputMode: _toggleCommentInputMode,
                onAppendEmoji: _appendEmoji,
                onSendComment: _handleSendComment,
                onShowMoreActions: () => _showMoreActions(state),
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

  void _handleBack() {
    GlobalRouter.instance.pop();
  }

  void _focusCommentInput() {
    _composerNotifier.hideEmojiPanel();
    _commentFocusNode.requestFocus();
  }

  void _dismissCommentInput() {
    _composerNotifier.hideEmojiPanel();
    _commentFocusNode.unfocus();
  }

  void _toggleCommentInputMode() {
    final composer = ref.read(feedDetailComposerProvider(widget.postId));
    if (composer.showEmojiPanel) {
      _commentFocusNode.requestFocus();
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) _composerNotifier.hideEmojiPanel();
      });
      return;
    }

    _commentFocusNode.unfocus();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _composerNotifier.showEmojiPanel();
    });
  }

  void _appendEmoji(String emoji) {
    final value = _controller.value;
    final selection = value.selection;
    final start = selection.isValid ? selection.start : value.text.length;
    final end = selection.isValid ? selection.end : value.text.length;
    final newText = value.text.replaceRange(start, end, emoji);
    _controller.value = value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: start + emoji.length),
      composing: TextRange.empty,
    );
  }

  Future<void> _handleSendComment() async {
    final content = _controller.text.trim();
    if (content.isEmpty) return;

    final composer = ref.read(feedDetailComposerProvider(widget.postId));
    await _detailNotifier.submitComment(
      content: content,
      replyToCommentId: composer.replyToCommentId,
    );
    _controller.clear();
    _composerNotifier.reset();
    _commentFocusNode.unfocus();
  }

  Future<void> _showMoreActions(PostDetailState state) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) => FeedDetailMoreActionsSheet(
        state: state,
        showDelete: state.post.author.userId == StorageKeys.userId,
        onSelectVisibility: (visibility) async {
          Navigator.of(sheetContext).pop();
          await _detailNotifier.updateVisibility(visibility);
        },
        onDelete: () async {
          Navigator.of(sheetContext).pop();
          final success = await _detailNotifier.deletePost();
          if (!mounted || !success) return;
          GlobalRouter.instance.pop();
        },
      ),
    );
  }
}
