import 'package:flutter/foundation.dart';
import 'package:network/network.dart';

@immutable
class ChatSettingsState {
  const ChatSettingsState({
    this.isLoading = false,
    this.isSubmitting = false,
    this.error,
    this.settings,
    this.isBlocked = false,
  });

  final bool isLoading;
  final bool isSubmitting;
  final Object? error;
  final GetChatSettingsResponse? settings;
  final bool isBlocked;

  bool get isFollowing => settings?.isFollowing ?? false;

  bool get isPinned => settings?.isPinned ?? false;

  String get remarkName => settings?.remarkName ?? '';

  String get chatBackgroundUrl => settings?.chatBackgroundUrl ?? '';

  bool get hasBackground => chatBackgroundUrl.isNotEmpty;

  ChatSettingsState copyWith({
    bool? isLoading,
    bool? isSubmitting,
    Object? error,
    GetChatSettingsResponse? settings,
    bool? isBlocked,
  }) {
    return ChatSettingsState(
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
      settings: settings ?? this.settings,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }
}
