enum ChatInputMode { text, voice }

class ChatConversationComposerState {
  const ChatConversationComposerState({
    this.inputMode = ChatInputMode.text,
    this.showEmojiPanel = false,
    this.showAttachmentPanel = false,
    this.isRecording = false,
    this.isCanceling = false,
    this.recordDurationSec = 0,
    this.isSending = false,
  });

  final ChatInputMode inputMode;
  final bool showEmojiPanel;
  final bool showAttachmentPanel;
  final bool isRecording;
  final bool isCanceling;
  final int recordDurationSec;
  final bool isSending;

  ChatConversationComposerState copyWith({
    ChatInputMode? inputMode,
    bool? showEmojiPanel,
    bool? showAttachmentPanel,
    bool? isRecording,
    bool? isCanceling,
    int? recordDurationSec,
    bool? isSending,
  }) {
    return ChatConversationComposerState(
      inputMode: inputMode ?? this.inputMode,
      showEmojiPanel: showEmojiPanel ?? this.showEmojiPanel,
      showAttachmentPanel: showAttachmentPanel ?? this.showAttachmentPanel,
      isRecording: isRecording ?? this.isRecording,
      isCanceling: isCanceling ?? this.isCanceling,
      recordDurationSec: recordDurationSec ?? this.recordDurationSec,
      isSending: isSending ?? this.isSending,
    );
  }
}
