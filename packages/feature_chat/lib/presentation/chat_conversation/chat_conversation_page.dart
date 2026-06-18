import 'package:core/colors/colors.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

import '../../models/chat_conversation.dart';
import '../../models/chat_message.dart';
import '../../providers/chat_providers.dart';
import '../../utils/chat_media_permissions.dart';
import 'chat_conversation_composer_provider.dart';
import 'chat_intimacy_provider.dart';
import 'view/chat_conversation_app_bar.dart';
import 'view/chat_conversation_input_bar.dart';
import 'view/chat_image_picker_page.dart';
import 'view/chat_intimacy_badge.dart';
import 'view/chat_intimacy_dialog.dart';
import 'view/chat_message_list.dart';

class ChatConversationPage extends ConsumerStatefulWidget {
  const ChatConversationPage({super.key, required this.userId});

  final String userId;

  static const _emojis = [
    '😀', '😁', '😂', '🤣', '😊', '😍', '😘', '🥰',
    '😎', '🤔', '😭', '😡', '👍', '👏', '🙏', '🎉',
  ];

  @override
  ConsumerState<ChatConversationPage> createState() =>
      _ChatConversationPageState();
}

class _ChatConversationPageState extends ConsumerState<ChatConversationPage> {
  final _inputController = TextEditingController();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();
  String? _selectedMessageId;

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
    _focusNode.dispose();
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

  Future<void> _openAlbum() async {
    final granted = await ChatMediaPermissions.requestPhotos();
    if (!granted) {
      return;
    }
    if (!mounted) return;
    final paths = await ChatImagePickerPage.show(context);
    if (paths == null || paths.isEmpty) return;
    await ref
        .read(chatConversationComposerProvider(widget.userId).notifier)
        .sendImages(paths);
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  void _dismissPanels() {
    ref.read(chatConversationComposerProvider(widget.userId).notifier).hideAllPanels();
    if (_selectedMessageId != null) {
      setState(() => _selectedMessageId = null);
    }
    _focusNode.unfocus();
  }

  Future<void> _showIntimacyDialog() async {
    try {
      final data = await ref.read(chatIntimacyProvider(widget.userId).future);
      if (!mounted) return;
      await ChatIntimacyDialog.show(context, data: data);
    } catch (_) {
      // 接口失败时不弹窗
    }
  }

  List<Widget> _buildIntimacyActions() {
    final intimacyAsync = ref.watch(chatIntimacyProvider(widget.userId));
    return intimacyAsync.when(
      data: (data) => [
        ChatIntimacyBadge(
          intimacy: data.intimacy.toInt(),
          onTap: _showIntimacyDialog,
        ),
      ],
      loading: () => const [
        SizedBox(
          width: 56,
          height: 32,
          child: Center(
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
      ],
      error: (e, __) {
        return const [];
      },
    );
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
    final backgroundUrl = conversation?.chatBackgroundUrl ?? '';

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (backgroundUrl.isNotEmpty)
            AppNetworkImage(
              url: backgroundUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            )
          else
            const DecoratedBox(
              decoration: BoxDecoration(
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
            ),
          SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    ChatConversationAppBar(
                      username: username,
                      prependActions: _buildIntimacyActions(),
                      onMoreTap: () => GlobalRouter.instance.push(
                        ChatSettingsRoute(userId: widget.userId),
                      ),
                    ),
                    Expanded(
                      child: ChatMessageList(
                        messages: messages,
                        peerAvatar: peerAvatar,
                        scrollController: _scrollController,
                        selectedMessageId: _selectedMessageId,
                        onLongPress: (message) {
                          final isMine = message.sender == ChatMessageSender.me;
                          final canCopy = message.type == ChatMessageType.text;
                          if (!isMine && !canCopy) return;
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
                        onBackgroundTap: _dismissPanels,
                      ),
                    ),
                    ChatConversationInputBar(
                      userId: widget.userId,
                      controller: _inputController,
                      focusNode: _focusNode,
                      emojis: ChatConversationPage._emojis,
                      onSendText: _sendMessage,
                      onOpenAlbum: _openAlbum,
                    ),
                  ],
                ),
                ChatVoiceRecordOverlayHost(userId: widget.userId),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
