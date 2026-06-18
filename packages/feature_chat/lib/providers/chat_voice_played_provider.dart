import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _playedVoiceKey = 'chat_played_voice_message_ids';

final chatVoicePlayedProvider =
    NotifierProvider<ChatVoicePlayedNotifier, Set<String>>(
  ChatVoicePlayedNotifier.new,
);

class ChatVoicePlayedNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    Future.microtask(_load);
    return const {};
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList(_playedVoiceKey) ?? const [];
    state = ids.toSet();
  }

  Future<void> markPlayed(String messageId) async {
    if (state.contains(messageId)) return;
    state = {...state, messageId};
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_playedVoiceKey, state.toList());
  }

  bool isPlayed(String messageId) => state.contains(messageId);
}
