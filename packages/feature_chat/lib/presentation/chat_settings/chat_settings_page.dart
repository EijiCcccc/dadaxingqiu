import 'package:core/colors/colors.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

import '../chat_conversation/view/chat_conversation_app_bar.dart';
import '../chat_conversation/view/chat_image_picker_page.dart';
import '../../utils/chat_media_permissions.dart';
import 'chat_settings_provider.dart';
import 'chat_settings_state.dart';
import 'view/chat_remark_dialog.dart';

class ChatSettingsPage extends ConsumerWidget {
  const ChatSettingsPage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatSettingsProvider(userId));

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.error != null && state.settings == null
                      ? _buildError(context, ref)
                      : _buildContent(context, ref, state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => GlobalRouter.instance.pop(),
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            ),
          ),
          const Text(
            '聊天设置',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('加载失败', style: TextStyle(color: AppColors.textMuted)),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () =>
                ref.read(chatSettingsProvider(userId).notifier).loadSettings(),
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    ChatSettingsState state,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildCard([
            _SettingsSwitchItem(
              title: '聊天置顶',
              value: state.isPinned,
              onChanged: state.isSubmitting
                  ? null
                  : (value) => ref
                      .read(chatSettingsProvider(userId).notifier)
                      .togglePin(value),
            ),
          ]),
          const SizedBox(height: 16),
          _buildCard([
            _SettingsActionItem(
              title: '设置备注',
              subtitle: state.remarkName.isNotEmpty ? state.remarkName : null,
              onTap: state.isSubmitting
                  ? null
                  : () => _showRemarkDialog(context, ref, state.remarkName),
            ),
            const Divider(height: 1),
            _SettingsActionItem(
              title: state.hasBackground ? '取消当前聊天背景' : '设置当前聊天背景',
              onTap: state.isSubmitting
                  ? null
                  : () => state.hasBackground
                      ? ref
                          .read(chatSettingsProvider(userId).notifier)
                          .clearBackground()
                      : _pickBackground(context, ref),
            ),
          ]),
          const SizedBox(height: 16),
          _buildCard([
            _SettingsActionItem(
              title: '删除对话',
              titleColor: Colors.red,
              onTap: state.isSubmitting
                  ? null
                  : () => _confirmDelete(context, ref),
            ),
            const Divider(height: 1),
            _SettingsActionItem(
              title: '举报',
              onTap: () => ChatReportDialog.show(context),
            ),
            const Divider(height: 1),
            _SettingsActionItem(
              title: state.isBlocked ? '已拉黑' : '拉黑',
              onTap: state.isBlocked || state.isSubmitting
                  ? null
                  : () => _confirmBlock(context, ref),
            ),
            const Divider(height: 1),
            _SettingsActionItem(
              title: state.isFollowing ? '取消关注' : '关注',
              onTap: state.isSubmitting
                  ? null
                  : () => ref
                      .read(chatSettingsProvider(userId).notifier)
                      .toggleFollow(),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(children: children),
    );
  }

  Future<void> _showRemarkDialog(
    BuildContext context,
    WidgetRef ref,
    String currentRemark,
  ) async {
    final result = await ChatRemarkDialog.show(
      context,
      initialRemark: currentRemark,
    );
    if (result == null) return;
    await ref.read(chatSettingsProvider(userId).notifier).updateRemark(result);
  }

  Future<void> _pickBackground(BuildContext context, WidgetRef ref) async {
    final granted = await ChatMediaPermissions.requestPhotos();
    if (!granted || !context.mounted) return;

    final paths = await ChatImagePickerPage.show(context, maxSelection: 1);
    if (paths == null || paths.isEmpty || !context.mounted) return;

    await ref
        .read(chatSettingsProvider(userId).notifier)
        .uploadBackgroundFromPath(paths.first);
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final result = await AppDialog.show(
      context,
      title: '删除后不可恢复，是否确定？',
      confirmText: '确定',
      cancelText: '取消',
    );
    if (result != true || !context.mounted) return;

    try {
      await ref.read(chatSettingsProvider(userId).notifier).deleteConversation();
      if (!context.mounted) return;
      GlobalRouter.instance.pop();
      GlobalRouter.instance.pop();
    } catch (_) {}
  }

  Future<void> _confirmBlock(BuildContext context, WidgetRef ref) async {
    final result = await AppDialog.show(
      context,
      title: '拉入黑名单后，你将不再收到对方消息，可在设置中管理，是否确定？',
      confirmText: '确定',
      cancelText: '取消',
    );
    if (result == true) {
      ref.read(chatSettingsProvider(userId).notifier).blockUser();
    }
  }
}

class _SettingsSwitchItem extends StatelessWidget {
  const _SettingsSwitchItem({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _SettingsActionItem extends StatelessWidget {
  const _SettingsActionItem({
    required this.title,
    this.subtitle,
    this.titleColor,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final Color? titleColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: titleColor ?? AppColors.textPrimary,
        ),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
      trailing: onTap == null
          ? null
          : const Icon(Icons.chevron_right, color: AppColors.textMuted),
      onTap: onTap,
    );
  }
}
