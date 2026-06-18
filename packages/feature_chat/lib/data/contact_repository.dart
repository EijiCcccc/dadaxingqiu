import 'package:core/core.dart';
import 'package:network/network.dart';

/// 通讯录相关接口
class ContactRepository {
  ContactRepository(this._client);

  final DioClient _client;

  Future<GetContactFriendsResponse> getFriends({
    int page = 1,
    int pageSize = 20,
  }) {
    return _client.getPb<GetContactFriendsResponse>(
      ApiPath.contactFriends,
      message: GetContactFriendsResponse.create,
      queryParameters: {
        'page': page,
        'page_size': pageSize,
      },
    );
  }

  Future<GetContactFollowingResponse> getFollowing({
    int page = 1,
    int pageSize = 20,
  }) {
    return _client.getPb<GetContactFollowingResponse>(
      ApiPath.contactFollowing,
      message: GetContactFollowingResponse.create,
      queryParameters: {
        'page': page,
        'page_size': pageSize,
      },
    );
  }

  Future<GetContactFollowersResponse> getFollowers({
    int page = 1,
    int pageSize = 20,
  }) {
    return _client.getPb<GetContactFollowersResponse>(
      ApiPath.contactFollowers,
      message: GetContactFollowersResponse.create,
      queryParameters: {
        'page': page,
        'page_size': pageSize,
      },
    );
  }
}
