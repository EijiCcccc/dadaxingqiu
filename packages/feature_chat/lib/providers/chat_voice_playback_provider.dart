import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/chat_message.dart';

class ChatVoicePlaybackState {
  const ChatVoicePlaybackState({
    this.playingMessageId,
    this.remainingSec = 0,
  });

  final String? playingMessageId;
  final int remainingSec;

  ChatVoicePlaybackState copyWith({
    String? playingMessageId,
    int? remainingSec,
    bool clearPlaying = false,
  }) {
    return ChatVoicePlaybackState(
      playingMessageId:
          clearPlaying ? null : playingMessageId ?? this.playingMessageId,
      remainingSec: remainingSec ?? this.remainingSec,
    );
  }
}

final chatVoicePlaybackProvider =
    NotifierProvider.autoDispose<ChatVoicePlaybackNotifier, ChatVoicePlaybackState>(
  ChatVoicePlaybackNotifier.new,
);

class ChatVoicePlaybackNotifier extends AutoDisposeNotifier<ChatVoicePlaybackState> {
  final _player = AudioPlayer();
  StreamSubscription<void>? _completeSub;
  StreamSubscription<Duration>? _positionSub;
  Timer? _countdownTimer;

  @override
  ChatVoicePlaybackState build() {
    ref.onDispose(_disposePlayer);
    _completeSub = _player.onPlayerComplete.listen((_) {
      state = const ChatVoicePlaybackState();
      _countdownTimer?.cancel();
    });
    return const ChatVoicePlaybackState();
  }

  Future<void> toggle(ChatMessage message) async {
    if (state.playingMessageId == message.id) {
      await stop();
      return;
    }
    await stop();
    final source = _resolveSource(message);
    if (source == null) return;

    await _player.play(source);
    final duration = message.voiceDurationSec ?? 0;
    state = ChatVoicePlaybackState(
      playingMessageId: message.id,
      remainingSec: duration,
    );
    _startCountdown(duration);
  }

  Future<void> stop() async {
    _countdownTimer?.cancel();
    await _player.stop();
    state = const ChatVoicePlaybackState();
  }

  void _startCountdown(int totalSec) {
    _countdownTimer?.cancel();
    if (totalSec <= 0) return;
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final next = state.remainingSec - 1;
      if (next <= 0) {
        timer.cancel();
        state = state.copyWith(remainingSec: 0);
        return;
      }
      state = state.copyWith(remainingSec: next);
    });
  }

  Source? _resolveSource(ChatMessage message) {
    final localPath = message.voiceLocalPath;
    if (localPath != null && localPath.isNotEmpty) {
      return DeviceFileSource(localPath);
    }
    final url = message.voiceUrl;
    if (url != null && url.isNotEmpty) {
      return UrlSource(url);
    }
    return null;
  }

  Future<void> _disposePlayer() async {
    _countdownTimer?.cancel();
    await _completeSub?.cancel();
    await _positionSub?.cancel();
    await _player.dispose();
  }
}
