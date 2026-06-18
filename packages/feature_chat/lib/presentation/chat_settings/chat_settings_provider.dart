import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

import '../../providers/chat_conversations_provider.dart';
import '../../providers/chat_repository_provider.dart';
import 'chat_settings_state.dart';

final chatSettingsProvider = NotifierProvider.autoDispose
    .family<ChatSettingsNotifier, ChatSettingsState, String>(
  ChatSettingsNotifier.new,
);

class ChatSettingsNotifier
    extends AutoDisposeFamilyNotifier<ChatSettingsState, String> {
  @override
  ChatSettingsState build(String arg) {
    Future.microtask(loadSettings);
    return const ChatSettingsState(isLoading: true);
  }

  String get _peerUserId => arg;

  Future<void> loadSettings() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final settings = await ref
          .read(chatRepositoryProvider)
          .getChatSettings(peerUserId: _peerUserId);
      state = state.copyWith(isLoading: false, settings: settings);
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error);
    }
  }

  Future<void> togglePin(bool value) async {
    if (state.isSubmitting) return;
    state = state.copyWith(isSubmitting: true);
    try {
      final response = await ref.read(chatRepositoryProvider).updateChatPin(
            peerUserId: _peerUserId,
            isPinned: value,
          );
      final current = state.settings ?? GetChatSettingsResponse();
      state = state.copyWith(
        isSubmitting: false,
        settings: current
          ..isPinned = response.isPinned
          ..pinnedAt = response.pinnedAt,
      );
      await ref.read(chatConversationsProvider.notifier).refreshFromIm();
    } catch (error) {
      state = state.copyWith(isSubmitting: false, error: error);
      AppToast.error('置顶设置失败');
    }
  }

  Future<void> updateRemark(String remarkName) async {
    if (state.isSubmitting) return;
    state = state.copyWith(isSubmitting: true);
    try {
      final response =
          await ref.read(chatRepositoryProvider).updateUserRemark(
                targetUserId: _peerUserId,
                remarkName: remarkName,
              );
      final current = state.settings ?? GetChatSettingsResponse();
      state = state.copyWith(
        isSubmitting: false,
        settings: current
          ..remarkName = response.remarkName
          ..displayName = response.displayName,
      );
      await ref.read(chatConversationsProvider.notifier).refreshFromIm();
      AppToast.success('备注设置成功');
    } catch (error) {
      state = state.copyWith(isSubmitting: false, error: error);
      AppToast.error('备注设置失败');
    }
  }

  Future<void> uploadBackgroundFromPath(String imagePath) async {
    if (state.isSubmitting) return;

    state = state.copyWith(isSubmitting: true);
    try {
      final file = File(imagePath);
      final bytes = await file.readAsBytes();
      if (bytes.isEmpty) {
        throw StateError('无法读取图片');
      }

      final fileName = imagePath.split('/').last;
      final contentType = _contentTypeFromFileName(fileName);
      final repo = ref.read(chatRepositoryProvider);

      final token = await repo.getBackgroundUploadToken(
        peerUserId: _peerUserId,
        fileName: fileName,
        contentType: contentType,
      );

      await repo.uploadImageToUrl(
        uploadUrl: token.uploadUrl,
        imageBytes: bytes,
        contentType: contentType,
      );

      final response = await repo.updateChatBackground(
        peerUserId: _peerUserId,
        backgroundUrl: token.publicUrl,
      );

      final current = state.settings ?? GetChatSettingsResponse();
      state = state.copyWith(
        isSubmitting: false,
        settings: current..chatBackgroundUrl = response.backgroundUrl,
      );
      await ref.read(chatConversationsProvider.notifier).refreshFromIm();
      AppToast.success('背景设置成功');
    } catch (error) {
      state = state.copyWith(isSubmitting: false, error: error);
      AppToast.error('背景设置失败');
    }
  }

  Future<void> clearBackground() async {
    if (state.isSubmitting) return;
    state = state.copyWith(isSubmitting: true);
    try {
      final response =
          await ref.read(chatRepositoryProvider).updateChatBackground(
                peerUserId: _peerUserId,
                backgroundUrl: '',
              );
      final current = state.settings ?? GetChatSettingsResponse();
      state = state.copyWith(
        isSubmitting: false,
        settings: current..chatBackgroundUrl = response.backgroundUrl,
      );
      await ref.read(chatConversationsProvider.notifier).refreshFromIm();
      AppToast.success('取消成功');
    } catch (error) {
      state = state.copyWith(isSubmitting: false, error: error);
      AppToast.error('取消背景失败');
    }
  }

  Future<void> deleteConversation() async {
    if (state.isSubmitting) return;
    state = state.copyWith(isSubmitting: true);
    try {
      await ref.read(chatRepositoryProvider).deleteChatConversation(
            peerUserId: _peerUserId,
          );
      await ref
          .read(chatConversationsProvider.notifier)
          .deleteConversation(_peerUserId);
      state = state.copyWith(isSubmitting: false);
    } catch (error) {
      state = state.copyWith(isSubmitting: false, error: error);
      AppToast.error('删除失败');
      rethrow;
    }
  }

  void blockUser() {
    state = state.copyWith(isBlocked: true);
    AppToast.success('已拉入黑名单');
  }

  Future<void> toggleFollow() async {
    if (state.isSubmitting) return;
    state = state.copyWith(isSubmitting: true);
    try {
      final repo = ref.read(chatRepositoryProvider);
      final current = state.settings ?? GetChatSettingsResponse();
      if (current.isFollowing) {
        await repo.unfollowUser(_peerUserId);
        state = state.copyWith(
          isSubmitting: false,
          settings: current..isFollowing = false,
        );
        AppToast.success('已取消关注');
      } else {
        await repo.followUser(_peerUserId);
        state = state.copyWith(
          isSubmitting: false,
          settings: current..isFollowing = true,
        );
        AppToast.success('关注成功');
      }
    } catch (error) {
      state = state.copyWith(isSubmitting: false, error: error);
      AppToast.error('操作失败');
    }
  }

  String _contentTypeFromFileName(String fileName) {
    final lower = fileName.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.webp')) return 'image/webp';
    return 'image/jpeg';
  }
}
