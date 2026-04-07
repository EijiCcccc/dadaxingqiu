import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _Message {
  _Message({
    required this.id,
    required this.type,
    required this.content,
    this.senderName,
    this.senderAvatar,
  });

  final int id;
  final String type; // 'user' | 'other' | 'system'
  final String content;
  final String? senderName;
  final String? senderAvatar;
}

final _mockMessages = [
  _Message(id: 1, type: 'system', content: '12:30'),
  _Message(
    id: 2,
    type: 'other',
    content: '在吗？周末一起去看电影吧！',
    senderName: '星辰漫步',
    senderAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop',
  ),
  _Message(
    id: 3,
    type: 'user',
    content: '好啊，看什么电影？',
    senderName: '我',
    senderAvatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100&h=100&fit=crop',
  ),
  _Message(
    id: 4,
    type: 'other',
    content: '听说新上映的科幻片不错，要不要一起去看？',
    senderName: '星辰漫步',
    senderAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop',
  ),
  _Message(
    id: 5,
    type: 'user',
    content: '可以啊，周六下午怎么样？',
    senderName: '我',
    senderAvatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100&h=100&fit=crop',
  ),
  _Message(id: 6, type: 'system', content: '星辰漫步撤回了一条消息'),
  _Message(
    id: 7,
    type: 'other',
    content: '周六下午完美！我们14:00在影院门口见？',
    senderName: '星辰漫步',
    senderAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop',
  ),
];

final _messagesProvider = StateProvider<List<_Message>>((ref) => _mockMessages);

class ChatConversationPage extends ConsumerStatefulWidget {
  const ChatConversationPage({super.key, required this.userId});

  final String userId;

  @override
  ConsumerState<ChatConversationPage> createState() => _ChatConversationPageState();
}

class _ChatConversationPageState extends ConsumerState<ChatConversationPage> {
  final _inputController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _inputController.text.trim();
    if (text.isEmpty) return;
    ref.read(_messagesProvider.notifier).state = [
      ...ref.read(_messagesProvider),
      _Message(
        id: DateTime.now().millisecondsSinceEpoch,
        type: 'user',
        content: text,
        senderName: '我',
        senderAvatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100&h=100&fit=crop',
      ),
    ];
    _inputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(_messagesProvider);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF3E8FF),
              Color(0xFFFDF2F8),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    if (msg.type == 'system') {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E7EB).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            msg.content,
                            style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                          ),
                        ),
                      );
                    }
                    final isUser = msg.type == 'user';
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (!isUser && msg.senderAvatar != null)
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(msg.senderAvatar!),
                            ),
                          if (!isUser) const SizedBox(width: 8),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                gradient: isUser
                                    ? const LinearGradient(
                                        colors: [Color(0xFFA855F7), Color(0xFFEC4899)],
                                      )
                                    : null,
                                color: isUser ? null : Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(12),
                                  topRight: const Radius.circular(12),
                                  bottomLeft: Radius.circular(isUser ? 12 : 4),
                                  bottomRight: Radius.circular(isUser ? 4 : 12),
                                ),
                                border: isUser ? null : Border.all(color: const Color(0xFFE9D5FF)),
                              ),
                              child: Text(
                                msg.content,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: isUser ? Colors.white : const Color(0xFF111827),
                                ),
                              ),
                            ),
                          ),
                          if (isUser) const SizedBox(width: 8),
                          if (isUser && msg.senderAvatar != null)
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(msg.senderAvatar!),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              _buildInputBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E8FF).withOpacity(0.8),
        border: Border(
          bottom: BorderSide(color: const Color(0xFFE9D5FF).withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => GlobalRouter.instance.pop(),
            icon: const Icon(Icons.arrow_back, color: Color(0xFF581C87)),
          ),
          const Expanded(
            child: Center(
              child: Text(
                '星辰漫步',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF581C87),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Color(0xFF581C87)),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        border: Border(
          top: BorderSide(color: const Color(0xFFE9D5FF).withOpacity(0.5)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _inputController,
              decoration: InputDecoration(
                hintText: '输入消息...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE9D5FF)),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 10),
          FilledButton(
            onPressed: _sendMessage,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF7C3AED),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('发送'),
          ),
        ],
      ),
    );
  }
}
