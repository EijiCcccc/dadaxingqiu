import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/chat_message.dart';
import '../../../providers/chat_voice_playback_provider.dart';
import '../../../providers/chat_voice_played_provider.dart';
import '../../../utils/chat_voice_bar_utils.dart';
import 'chat_message_avatar.dart';

class ChatMessageVoiceBubble extends ConsumerWidget {
  const ChatMessageVoiceBubble({
    super.key,
    required this.message,
    required this.peerAvatar,
    required this.isMine,
    required this.onLongPress,
  });

  final ChatMessage message;
  final String peerAvatar;
  final bool isMine;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playback = ref.watch(chatVoicePlaybackProvider);
    final isPlaying = playback.playingMessageId == message.id;
    final playedNotifier = ref.read(chatVoicePlayedProvider.notifier);
    final showUnreadDot = !isMine && !playedNotifier.isPlayed(message.id);

    final durationSec = message.voiceDurationSec ?? 0;
    final displaySec = isPlaying ? playback.remainingSec : durationSec;
    final barWidth = ChatVoiceBarUtils.barWidth(durationSec);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMine) ...[
            ChatMessageAvatar(url: peerAvatar),
            const SizedBox(width: 8),
          ],
          Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onLongPress: onLongPress,
                onTap: () async {
                  await ref.read(chatVoicePlaybackProvider.notifier).toggle(message);
                  if (!isMine) {
                    await playedNotifier.markPlayed(message.id);
                  }
                },
                child: Container(
                  width: barWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: isMine
                        ? const LinearGradient(
                            colors: [AppColors.primaryLight, AppColors.accent],
                          )
                        : null,
                    color: isMine ? null : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12),
                      bottomLeft: Radius.circular(isMine ? 12 : 4),
                      bottomRight: Radius.circular(isMine ? 4 : 12),
                    ),
                    border: isMine ? null : Border.all(color: AppColors.borderPurple),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _VoicePlayIcon(isPlaying: isPlaying, isMine: isMine),
                      const SizedBox(width: 8),
                      Text(
                        ChatVoiceBarUtils.formatDuration(displaySec),
                        style: TextStyle(
                          fontSize: 14,
                          color: isMine ? Colors.white : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (showUnreadDot)
                Positioned(
                  top: -2,
                  right: isMine ? null : -6,
                  left: isMine ? -6 : null,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          if (isMine) ...[
            const SizedBox(width: 8),
            const ChatMessageAvatar(url: ''),
          ],
        ],
      ),
    );
  }
}

class _VoicePlayIcon extends StatefulWidget {
  const _VoicePlayIcon({required this.isPlaying, required this.isMine});

  final bool isPlaying;
  final bool isMine;

  @override
  State<_VoicePlayIcon> createState() => _VoicePlayIconState();
}

class _VoicePlayIconState extends State<_VoicePlayIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    if (widget.isPlaying) _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant _VoicePlayIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.isPlaying) {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.isMine ? Colors.white : AppColors.primary;
    if (!widget.isPlaying) {
      return Icon(
        widget.isMine ? Icons.volume_up : Icons.volume_up_outlined,
        size: 18,
        color: color,
      );
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final phase = (_controller.value + index * 0.2) % 1.0;
            return Container(
              width: 3,
              height: 6 + phase * 8,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(1),
              ),
            );
          }),
        );
      },
    );
  }
}
