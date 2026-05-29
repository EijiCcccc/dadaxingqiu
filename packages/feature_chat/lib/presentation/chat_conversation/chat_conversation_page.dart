import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/chat_conversation.dart';
import '../../providers/chat_providers.dart';
import 'view/chat_conversation_app_bar.dart';
import 'view/chat_conversation_input_bar.dart';
import 'view/chat_message_list.dart';

class ChatConversationPage extends ConsumerStatefulWidget {
  const ChatConversationPage({super.key, required this.userId});

  final String userId;

  @override
  ConsumerState<ChatConversationPage> createState() =>
      _ChatConversationPageState();
}

class _ChatConversationPageState extends ConsumerState<ChatConversationPage> {
  final _inputController = TextEditingController();
  final _scrollController = ScrollController();
  String? _selectedMessageId;
  bool _showMoreMenu = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(chatMessagesProvider(widget.userId).notifier)
          .markConversationRead();
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _inputController.text;
    if (text.trim().isEmpty) return;

    ref.read(chatMessagesProvider(widget.userId).notifier).sendMessage(text);
    _inputController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  ChatConversation? _findConversation() {
    return ref
        .read(chatConversationsProvider.notifier)
        .findByUserId(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(chatConversationsProvider);
    final messages = ref
        .watch(chatMessagesProvider(widget.userId))
        .where((message) => !message.isDeletedForMe)
        .toList();
    final conversation = _findConversation();
    final username = conversation?.username ?? '用户${widget.userId}';
    final peerAvatar = conversation?.avatar ?? '';

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.bgPurple100,
              AppColors.bgPink50,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  ChatConversationAppBar(
                    username: username,
                    onMoreTap: () => setState(() => _showMoreMenu = true),
                  ),
                  Expanded(
                    child: ChatMessageList(
                      messages: messages,
                      peerAvatar: peerAvatar,
                      scrollController: _scrollController,
                      selectedMessageId: _selectedMessageId,
                      onLongPress: (message) {
                        setState(() => _selectedMessageId = message.id);
                      },
                      onCopy: (message) {
                        copyChatMessage(message);
                        setState(() => _selectedMessageId = null);
                      },
                      onRecall: (message) {
                        ref
                            .read(chatMessagesProvider(widget.userId).notifier)
                            .recallMessage(message.id);
                        setState(() => _selectedMessageId = null);
                      },
                      onDelete: (message) {
                        ref
                            .read(chatMessagesProvider(widget.userId).notifier)
                            .deleteMessage(message.id);
                        setState(() => _selectedMessageId = null);
                      },
                      onDismissMenu: () {
                        setState(() => _selectedMessageId = null);
                      },
                    ),
                  ),
                  ChatConversationInputBar(
                    controller: _inputController,
                    onSend: _sendMessage,
                  ),
                ],
              ),
              if (_showMoreMenu)
                ChatMoreMenu(
                  onReport: () {
                    setState(() => _showMoreMenu = false);
                    ChatReportDialog.show(context);
                  },
                  onDismiss: () => setState(() => _showMoreMenu = false),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
