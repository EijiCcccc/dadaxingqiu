import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';

class ChatVoiceRecordOverlay extends StatelessWidget {
  const ChatVoiceRecordOverlay({
    super.key,
    required this.durationSec,
    required this.isCanceling,
  });

  final int durationSec;
  final bool isCanceling;

  String get _hintText {
    if (isCanceling) return '松开取消发送';
    return '上滑取消发送';
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        color: Colors.black.withOpacity(0.45),
        alignment: Alignment.center,
        child: Container(
          width: 180,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          decoration: BoxDecoration(
            color: isCanceling ? Colors.red.shade400 : AppColors.textPrimary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _VoiceWaveAnimation(isCanceling: isCanceling),
              const SizedBox(height: 16),
              Text(
                '${durationSec}s',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _hintText,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VoiceWaveAnimation extends StatefulWidget {
  const _VoiceWaveAnimation({required this.isCanceling});

  final bool isCanceling;

  @override
  State<_VoiceWaveAnimation> createState() => _VoiceWaveAnimationState();
}

class _VoiceWaveAnimationState extends State<_VoiceWaveAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            final phase = (_controller.value + index * 0.15) % 1.0;
            final height = 8 + phase * 20;
            return Container(
              width: 4,
              height: height,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: widget.isCanceling
                    ? Colors.white.withOpacity(0.9)
                    : AppColors.accent,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        );
      },
    );
  }
}
