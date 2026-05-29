import 'package:network/network.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimAdvancedMsgListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimConversationListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/V2TimSDKListener.dart';
import 'package:tencent_cloud_chat_sdk/enum/log_level_enum.dart';
import 'package:tencent_cloud_chat_sdk/manager/v2_tim_manager.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_conversation.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';
import 'package:tencent_cloud_chat_sdk/tencent_im_sdk_plugin.dart';

import '../models/chat_conversation.dart';
import '../models/chat_message.dart';
import 'tencent_im_mapper.dart';
import 'package:fixnum/fixnum.dart';

typedef ImConversationsChanged = void Function();
typedef ImMessagesChanged = void Function(String userId);
typedef FetchIMSession = Future<GetIMSessionResponse> Function();

/// 腾讯 IM SDK 封装
class TencentImService {
  TencentImService({required FetchIMSession fetchSession})
      : _fetchSession = fetchSession;

  final FetchIMSession _fetchSession;

  final V2TIMManager _manager = TencentImSDKPlugin.v2TIMManager;

  bool _initialized = false;
  bool _loggedIn = false;
  String? _currentUserId;
  int? _sdkAppId;

  ImConversationsChanged? onConversationsChanged;
  ImMessagesChanged? onMessagesChanged;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  String? get currentUserId => _currentUserId;

  V2TIMManager get manager => _manager;

  Future<void> init() async {
    // SDK 初始化在首次 login 时根据服务端下发的 sdk_app_id 完成
  }

  Future<bool> login() async {
    final session = await _fetchSession();
    if (!session.hasImUserId() || !session.hasUserSig()) {
      return false;
    }

    final sdkAppId = session.sdkAppId.toInt();
    await _ensureInitialized(sdkAppId);

    final imUserId = session.imUserId;
    if (_loggedIn && _currentUserId == imUserId) return true;

    if (_loggedIn) {
      await logout();
    }

    final result = await _manager.login(
      userID: imUserId,
      userSig: session.userSig,
    );
    _loggedIn = result.code == 0;
    if (_loggedIn) {
      _currentUserId = imUserId;
    }
    return _loggedIn;
  }

  Future<void> logout() async {
    if (!_loggedIn) return;
    await _manager.logout();
    _loggedIn = false;
    _currentUserId = null;
  }

  Future<List<ChatConversation>> fetchConversations() async {
    if (!_loggedIn) return [];

    final conversations = <V2TimConversation>[];
    var nextSeq = '0';
    var finished = false;

    while (!finished) {
      final result = await _manager.v2ConversationManager.getConversationList(
        nextSeq: nextSeq,
        count: 100,
      );
      if (result.code != 0 || result.data == null) break;

      conversations.addAll(
        (result.data!.conversationList ?? []).whereType<V2TimConversation>(),
      );
      finished = result.data!.isFinished ?? true;
      nextSeq = result.data!.nextSeq ?? '0';
      if (nextSeq.isEmpty) break;
    }

    return conversations
        .where((item) => item.userID?.isNotEmpty == true)
        .map(TencentImMapper.toConversation)
        .toList();
  }

  Future<List<ChatMessage>> fetchMessages(String peerUserId) async {
    if (!_loggedIn || _currentUserId == null) return [];

    final result = await _manager.v2TIMMessageManager.getHistoryMessageList(
      userID: peerUserId,
      count: 30,
    );

    if (result.code != 0 || result.data == null) return [];

    final messages = result.data!
        .map(
          (message) => TencentImMapper.toChatMessage(
            message,
            currentUserId: _currentUserId!,
          ),
        )
        .whereType<ChatMessage>()
        .toList();
    messages.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return messages;
  }

  Future<bool> sendTextMessage({
    required String peerUserId,
    required String text,
  }) async {
    if (!_loggedIn) return false;

    final createResult =
        await _manager.v2TIMMessageManager.createTextMessage(text: text);
    if (createResult.code != 0 || createResult.data?.id == null) {
      return false;
    }

    final sendResult = await _manager.v2TIMMessageManager.sendMessage(
      id: createResult.data!.id!,
      receiver: peerUserId.contains('u_') ? peerUserId : 'u_$peerUserId',
      groupID: '',
    );

    if (sendResult.code == 0) {
      onMessagesChanged?.call(peerUserId);
      onConversationsChanged?.call();
    }
    return sendResult.code == 0;
  }

  Future<bool> revokeMessage(String msgId) async {
    if (!_loggedIn) return false;
    final result =
        await _manager.v2TIMMessageManager.revokeMessage(msgID: msgId);
    if (result.code == 0) {
      onConversationsChanged?.call();
    }
    return result.code == 0;
  }

  Future<bool> deleteConversation(String peerUserId) async {
    if (!_loggedIn) return false;
    final result = await _manager.v2ConversationManager.deleteConversation(
      conversationID: TencentImMapper.c2cConversationId(peerUserId),
    );
    if (result.code == 0) {
      onConversationsChanged?.call();
    }
    return result.code == 0;
  }

  Future<void> markConversationRead(String peerUserId) async {
    if (!_loggedIn) return;
    await _manager.v2ConversationManager.cleanConversationUnreadMessageCount(
      conversationID: TencentImMapper.c2cConversationId(peerUserId),
      cleanTimestamp: 0,
      cleanSequence: 0,
    );
    onConversationsChanged?.call();
  }

  Future<void> _ensureInitialized(int sdkAppId) async {
    if (_initialized && _sdkAppId == sdkAppId) return;

    if (_initialized) {
      await logout();
      _initialized = false;
    }

    _sdkAppId = sdkAppId;

    final result = await _manager.initSDK(
      sdkAppID: sdkAppId,
      loglevel: LogLevelEnum.V2TIM_LOG_WARN,
      listener: V2TimSDKListener(
        onUserSigExpired: () {
          _loggedIn = false;
          login();
        },
        onKickedOffline: () => _loggedIn = false,
      ),
    );

    _initialized = result.data == true;
    if (!_initialized) return;

    await _manager.v2ConversationManager.addConversationListener(
      listener: V2TimConversationListener(
        onNewConversation: (_) => onConversationsChanged?.call(),
        onConversationChanged: (_) => onConversationsChanged?.call(),
        onConversationDeleted: (_) => onConversationsChanged?.call(),
      ),
    );

    await _manager.v2TIMMessageManager.addAdvancedMsgListener(
      listener: V2TimAdvancedMsgListener(
        onRecvNewMessage: (message) {
          final userId = _peerUserIdFromMessage(message);
          if (userId != null) {
            onMessagesChanged?.call(userId);
          }
          onConversationsChanged?.call();
        },
        onRecvMessageRevoked: (_) => onConversationsChanged?.call(),
      ),
    );
  }

  String? _peerUserIdFromMessage(V2TimMessage message) {
    if (message.isSelf == true) {
      return message.userID;
    }
    return message.sender ?? message.userID;
  }
}
