import 'package:core/core.dart';
import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

import '../../../providers/chat_providers.dart';
import 'view/message_conversation_list_item.dart';
import 'view/message_tab_header.dart';

/// 主首页「消息」Tab
class MessageTab extends ConsumerWidget {
  const MessageTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversations = ref.watch(sortedChatConversationsProvider);

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const MessageTabHeader(),
          Expanded(
            child: conversations.isEmpty
                ? const Center(
                    child: Text(
                      '暂无消息',
                      style: TextStyle(color: AppColors.textMuted),
                    ),
                  )
                : ListView.builder(
                    itemCount: conversations.length,
                    itemBuilder: (context, index) {
                      final conversation = conversations[index];
                      return MessageConversationListItem(
                        conversation: conversation,
                        onTap: () => GlobalRouter.instance.push(
                          ChatRoute(userId: conversation.userId),
                        ),
                        onDelete: () => _confirmDelete(
                          context,
                          ref,
                          conversation.userId,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String userId,
  ) async {
    final result = await AppDialog.show(
      context,
      title: '删除后不可恢复，是否确定？',
      confirmText: '确定',
      cancelText: '取消',
    );
    if (result == true) {
      ref.read(chatConversationsProvider.notifier).deleteConversation(userId);
    }
  }
}
