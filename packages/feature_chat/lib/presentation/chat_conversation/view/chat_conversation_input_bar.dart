import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../chat_conversation_composer_provider.dart';
import '../chat_conversation_composer_state.dart';
import 'chat_attachment_panel.dart';
import 'chat_emoji_panel.dart';
import 'chat_voice_record_overlay.dart';

class ChatConversationInputBar extends ConsumerWidget {
  const ChatConversationInputBar({
    super.key,
    required this.userId,
    required this.controller,
    required this.focusNode,
    required this.emojis,
    required this.onSendText,
    required this.onOpenAlbum,
  });

  final String userId;
  final TextEditingController controller;
  final FocusNode focusNode;
  final List<String> emojis;
  final VoidCallback onSendText;
  final Future<void> Function() onOpenAlbum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final composer = ref.watch(chatConversationComposerProvider(userId));
    final notifier = ref.read(chatConversationComposerProvider(userId).notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            border: Border(
              top: BorderSide(color: AppColors.borderPurple.withOpacity(0.5)),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _ModeIconButton(
                isVoiceMode: composer.inputMode == ChatInputMode.voice,
                onTap: notifier.toggleInputMode,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: composer.inputMode == ChatInputMode.text
                    ? _TextInputField(
                        controller: controller,
                        focusNode: focusNode,
                        onSend: onSendText,
                        onTap: notifier.hideAllPanels,
                      )
                    : _HoldToSpeakButton(userId: userId),
              ),
              const SizedBox(width: 6),
              _IconButton(
                icon: composer.showEmojiPanel
                    ? Icons.keyboard_outlined
                    : Icons.emoji_emotions_outlined,
                onTap: () {
                  if (composer.showEmojiPanel) {
                    notifier.hideEmojiPanel();
                    focusNode.requestFocus();
                  } else {
                    focusNode.unfocus();
                    notifier.toggleEmojiPanel();
                  }
                },
              ),
              _IconButton(
                icon: Icons.add_circle_outline,
                onTap: () {
                  focusNode.unfocus();
                  notifier.toggleAttachmentPanel();
                },
              ),
            ],
          ),
        ),
        if (composer.showAttachmentPanel)
          ChatAttachmentPanel(
            onAlbumTap: () async {
              notifier.hideAttachmentPanel();
              await onOpenAlbum();
            },
            onCameraTap: notifier.takePhoto,
          ),
        if (composer.showEmojiPanel)
          ChatEmojiPanel(
            emojis: emojis,
            onSelect: notifier.sendEmoji,
          ),
      ],
    );
  }
}

class _ModeIconButton extends StatelessWidget {
  const _ModeIconButton({
    required this.isVoiceMode,
    required this.onTap,
  });

  final bool isVoiceMode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _IconButton(
      icon: isVoiceMode ? Icons.keyboard_outlined : Icons.mic_none_outlined,
      onTap: onTap,
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icon, color: AppColors.textSecondary, size: 26),
      ),
    );
  }
}

class _TextInputField extends StatelessWidget {
  const _TextInputField({
    required this.controller,
    required this.focusNode,
    required this.onSend,
    required this.onTap,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSend;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.send,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: '输入消息...',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderPurple),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
      onSubmitted: (_) => onSend(),
    );
  }
}

class _HoldToSpeakButton extends ConsumerWidget {
  const _HoldToSpeakButton({required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final composer = ref.watch(chatConversationComposerProvider(userId));
    final notifier = ref.read(chatConversationComposerProvider(userId).notifier);

    return GestureDetector(
      onLongPressStart: (_) => notifier.startRecording(),
      onLongPressMoveUpdate: (details) {
        notifier.updateRecordingCancel(details.offsetFromOrigin.dy);
      },
      onLongPressEnd: (_) => notifier.finishRecording(),
      onLongPressCancel: notifier.cancelRecording,
      child: Container(
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderPurple),
        ),
        child: Text(
          composer.isRecording ? '松开发送' : '按住说话',
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// 录音浮层，由页面 Stack 挂载
class ChatVoiceRecordOverlayHost extends ConsumerWidget {
  const ChatVoiceRecordOverlayHost({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final composer = ref.watch(chatConversationComposerProvider(userId));
    if (!composer.isRecording) return const SizedBox.shrink();
    return ChatVoiceRecordOverlay(
      durationSec: composer.recordDurationSec,
      isCanceling: composer.isCanceling,
    );
  }
}
