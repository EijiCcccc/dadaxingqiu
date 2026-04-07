import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

class _ChatItem {
  const _ChatItem({
    required this.id,
    required this.avatar,
    required this.username,
    required this.lastMessage,
    required this.time,
    required this.unread,
  });

  final int id;
  final String avatar;
  final String username;
  final String lastMessage;
  final String time;
  final int unread;
}

const _mockChats = [
  _ChatItem(
      id: 1,
      avatar:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop',
      username: '星辰漫步',
      lastMessage: '晚上一起打游戏吗？',
      time: '18:30',
      unread: 2),
  _ChatItem(
      id: 2,
      avatar:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop',
      username: '宇宙旅行者',
      lastMessage: '那部电影真的超级好看！',
      time: '17:45',
      unread: 0),
  _ChatItem(
      id: 3,
      avatar:
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop',
      username: '月光女神',
      lastMessage: '周末去新开的咖啡店吧～',
      time: '15:20',
      unread: 1),
  _ChatItem(
      id: 4,
      avatar:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop',
      username: '星际探险',
      lastMessage: '明天健身房见！',
      time: '昨天',
      unread: 0),
  _ChatItem(
      id: 5,
      avatar:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&h=100&fit=crop',
      username: '流星雨',
      lastMessage: '新画的同人图你看看怎么样',
      time: '昨天',
      unread: 0),
  _ChatItem(
      id: 6,
      avatar:
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100&h=100&fit=crop',
      username: '银河系长',
      lastMessage: '这个bug终于修好了哈哈',
      time: '周二',
      unread: 0),
];

final _messageTabChatsProvider =
    StateProvider<List<_ChatItem>>((ref) => List.from(_mockChats));

/// 主首页「消息」Tab
class MessageTab extends ConsumerWidget {
  const MessageTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chats = ref.watch(_messageTabChatsProvider);

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF3E8FF).withOpacity(0.8),
              border: Border(
                bottom:
                    BorderSide(color: const Color(0xFFE9D5FF).withOpacity(0.5)),
              ),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '消息',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF581C87),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    border: Border(
                      bottom: BorderSide(
                          color: const Color(0xFFF3E8FF).withOpacity(0.5)),
                    ),
                  ),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(chat.avatar),
                        ),
                        if (chat.unread > 0)
                          Positioned(
                            top: -2,
                            right: -2,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Color(0xFFA855F7),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${chat.unread}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: Text(
                      chat.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF111827),
                      ),
                    ),
                    subtitle: Text(
                      chat.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    trailing: Text(
                      chat.time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                    onTap: () => GlobalRouter.instance
                        .push(ChatRoute(userId: '${chat.id}')),
                    onLongPress: () =>
                        _showDeleteDialog(context, ref, chat.id, chats),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDeleteDialog(
    BuildContext context,
    WidgetRef ref,
    int chatId,
    List<_ChatItem> chats,
  ) async {
    final result = await AppDialog.show(
      context,
      title: '删除后不可恢复，是否确定？',
      confirmText: '确定',
      cancelText: '取消',
    );
    if (result == true) {
      ref.read(_messageTabChatsProvider.notifier).state =
          chats.where((c) => c.id != chatId).toList();
      AppToast.success('已删除');
    }
  }
}
