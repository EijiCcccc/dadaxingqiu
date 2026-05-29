import 'package:core/core.dart';
import 'package:network/network.dart';

/// IM 相关接口
class ChatRepository {
  ChatRepository(this._client);

  final DioClient _client;

  /// GET `/api/v1/im/session`
  Future<GetIMSessionResponse> getIMSession() async {
    return _client.getPb<GetIMSessionResponse>(
      ApiPath.imSession,
      message: GetIMSessionResponse.create,
    );
  }
}
