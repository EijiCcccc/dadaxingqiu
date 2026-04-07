import 'package:core/core.dart';
import 'package:network/network.dart';

/// 探索星球 / 用户相关数据仓库
class UserRepository {
  UserRepository(this._client);

  final DioClient _client;

  /// 获取我的主页摘要（需登录）
  Future<MySummary> getMySummary() async {
    final res = await _client.getPb<MySummary>(
      ApiPath.meSummary,
      message: MySummary.new,
    );
    return res;
  }

  /// 获取探索列表（需登录，分页）
  Future<GetExploreCardsResponse> getExploreCards({
    int page = 1,
    int pageSize = 20,
  }) async {
    return _client.getPb<GetExploreCardsResponse>(
      ApiPath.exploreCards,
      message: GetExploreCardsResponse.new,
      queryParameters: {'page': page, 'page_size': pageSize},
    );
  }
}
