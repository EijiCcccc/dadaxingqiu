import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:shared/shared.dart';

import '../../providers/chat_messages_provider.dart';
import '../../utils/chat_media_permissions.dart';
import 'chat_conversation_composer_state.dart';

final chatConversationComposerProvider = NotifierProvider.autoDispose
    .family<ChatConversationComposerNotifier, ChatConversationComposerState,
        String>(
  ChatConversationComposerNotifier.new,
);

class ChatConversationComposerNotifier
    extends AutoDisposeFamilyNotifier<ChatConversationComposerState, String> {
  static const _cancelSlideThreshold = 80.0;
  static const _minVoiceDurationSec = 1;
  static const _maxVoiceDurationSec = 60;

  final _recorder = AudioRecorder();
  Timer? _recordTimer;
  String? _recordFilePath;

  @override
  ChatConversationComposerState build(String userId) {
    ref.onDispose(_disposeRecorder);
    return const ChatConversationComposerState();
  }

  void toggleInputMode() {
    final nextMode = state.inputMode == ChatInputMode.text
        ? ChatInputMode.voice
        : ChatInputMode.text;
    state = state.copyWith(
      inputMode: nextMode,
      showEmojiPanel: false,
      showAttachmentPanel: false,
    );
  }

  void toggleEmojiPanel() {
    final show = !state.showEmojiPanel;
    state = state.copyWith(
      showEmojiPanel: show,
      showAttachmentPanel: false,
    );
  }

  void hideEmojiPanel() {
    if (!state.showEmojiPanel) return;
    state = state.copyWith(showEmojiPanel: false);
  }

  void toggleAttachmentPanel() {
    final show = !state.showAttachmentPanel;
    state = state.copyWith(
      showAttachmentPanel: show,
      showEmojiPanel: false,
    );
  }

  void hideAttachmentPanel() {
    if (!state.showAttachmentPanel) return;
    state = state.copyWith(showAttachmentPanel: false);
  }

  void hideAllPanels() {
    state = state.copyWith(
      showEmojiPanel: false,
      showAttachmentPanel: false,
    );
  }

  Future<void> sendEmoji(String emoji) async {
    if (state.isSending) return;
    state = state.copyWith(isSending: true);
    try {
      await ref.read(chatMessagesProvider(arg).notifier).sendMessage(emoji);
    } finally {
      state = state.copyWith(isSending: false);
    }
  }

  Future<void> takePhoto() async {
    hideAttachmentPanel();
    final granted = await ChatMediaPermissions.requestCamera();
    if (!granted) {
      AppToast.error('需要相机权限才能拍摄');
      return;
    }
    final file = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
      maxWidth: 2048,
      maxHeight: 2048,
    );
    if (file == null) return;
    await sendImages([file.path]);
  }

  Future<void> sendImages(List<String> paths) async {
    if (state.isSending || paths.isEmpty) return;
    state = state.copyWith(isSending: true);
    try {
      final notifier = ref.read(chatMessagesProvider(arg).notifier);
      for (final path in paths) {
        await notifier.sendImage(path);
      }
    } finally {
      state = state.copyWith(isSending: false);
    }
  }

  Future<void> startRecording() async {
    if (state.isRecording || state.isSending) return;
    final granted = await ChatMediaPermissions.requestMicrophone();
    if (!granted) {
      AppToast.error('需要麦克风权限才能发送语音');
      return;
    }
    if (!await _recorder.hasPermission()) {
      AppToast.error('无法访问麦克风');
      return;
    }

    final dir = await getTemporaryDirectory();
    _recordFilePath = p.join(
      dir.path,
      'chat_voice_${DateTime.now().millisecondsSinceEpoch}.m4a',
    );
    await _recorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc),
      path: _recordFilePath!,
    );
    state = state.copyWith(
      isRecording: true,
      isCanceling: false,
      recordDurationSec: 0,
    );
    _recordTimer?.cancel();
    _recordTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final next = state.recordDurationSec + 1;
      state = state.copyWith(recordDurationSec: next);
      if (next >= _maxVoiceDurationSec) {
        finishRecording();
      }
    });
  }

  void updateRecordingCancel(double offsetY) {
    if (!state.isRecording) return;
    state = state.copyWith(isCanceling: offsetY < -_cancelSlideThreshold);
  }

  Future<void> finishRecording() async {
    if (!state.isRecording) return;
    _recordTimer?.cancel();
    final path = _recordFilePath;
    final duration = state.recordDurationSec;
    final canceled = state.isCanceling;
    state = state.copyWith(
      isRecording: false,
      isCanceling: false,
      recordDurationSec: 0,
    );
    await _recorder.stop();
    _recordFilePath = null;

    if (canceled || path == null) {
      await _deleteFile(path);
      return;
    }
    if (duration < _minVoiceDurationSec) {
      await _deleteFile(path);
      AppToast.error('录音时间太短');
      return;
    }

    state = state.copyWith(isSending: true);
    try {
      await ref.read(chatMessagesProvider(arg).notifier).sendVoice(
            path: path,
            durationSec: duration,
          );
    } finally {
      state = state.copyWith(isSending: false);
    }
  }

  Future<void> cancelRecording() async {
    if (!state.isRecording) return;
    _recordTimer?.cancel();
    state = state.copyWith(
      isRecording: false,
      isCanceling: false,
      recordDurationSec: 0,
    );
    await _recorder.stop();
    await _deleteFile(_recordFilePath);
    _recordFilePath = null;
  }

  Future<void> _deleteFile(String? path) async {
    if (path == null) return;
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<void> _disposeRecorder() async {
    _recordTimer?.cancel();
    if (await _recorder.isRecording()) {
      await _recorder.stop();
    }
    await _recorder.dispose();
  }
}
