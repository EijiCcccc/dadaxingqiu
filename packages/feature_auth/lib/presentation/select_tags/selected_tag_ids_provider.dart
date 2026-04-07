import 'package:feature_auth/providers/auth_repository_provider.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

/// 选中的标签 ID 集合（与后端 `tag_ids` 一致，使用数字字符串）
final selectedTagIdsProvider =
    NotifierProvider<SelectedTagIdsNotifier, Set<String>>(SelectedTagIdsNotifier.new);

class SelectedTagIdsNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => <String>{};

  void toggle(String id) {
    final next = Set<String>.from(state);
    if (next.contains(id)) {
      next.remove(id);
    } else {
      next.add(id);
    }
    state = next;
  }

  void reset() => state = <String>{};
}

/// 是否已选择至少一个标签
final hasSelectedTagsProvider = Provider<bool>((ref) {
  return ref.watch(selectedTagIdsProvider).isNotEmpty;
});

/// 默认标签列表（API 失败时兜底）
GetTagsResponse fallbackGetTagsResponse() {
  return GetTagsResponse()
    ..groups.addAll([
      TagGroup()
        ..type = 'group_a'
        ..title = 'A类型标签'
        ..items.addAll([
          UserTag()
            ..id = Int64(101)
            ..name = '找聊天搭子'
            ..type = 'a',
          UserTag()
            ..id = Int64(102)
            ..name = '找游戏搭子'
            ..type = 'a',
          UserTag()
            ..id = Int64(103)
            ..name = '找运动搭子'
            ..type = 'a',
          UserTag()
            ..id = Int64(104)
            ..name = '找学习搭子'
            ..type = 'a',
          UserTag()
            ..id = Int64(105)
            ..name = '找饭搭子'
            ..type = 'a',
          UserTag()
            ..id = Int64(106)
            ..name = '找旅行搭子'
            ..type = 'a',
        ]),
      TagGroup()
        ..type = 'group_b'
        ..title = 'B类型标签'
        ..items.addAll([
          UserTag()..id = Int64(201)..name = '电影'..type = 'b',
          UserTag()..id = Int64(202)..name = '音乐'..type = 'b',
          UserTag()..id = Int64(203)..name = '游戏'..type = 'b',
          UserTag()..id = Int64(204)..name = '动漫'..type = 'b',
          UserTag()..id = Int64(205)..name = '读书'..type = 'b',
          UserTag()..id = Int64(206)..name = '美食'..type = 'b',
          UserTag()..id = Int64(207)..name = '旅行'..type = 'b',
          UserTag()..id = Int64(208)..name = '摄影'..type = 'b',
          UserTag()..id = Int64(209)..name = '运动'..type = 'b',
          UserTag()..id = Int64(210)..name = '健身'..type = 'b',
        ]),
      TagGroup()
        ..type = 'group_c'
        ..title = 'C类型标签'
        ..items.addAll([
          UserTag()..id = Int64(301)..name = '夜猫子'..type = 'c',
          UserTag()..id = Int64(302)..name = '早起鸟'..type = 'c',
          UserTag()..id = Int64(303)..name = '社交达人'..type = 'c',
          UserTag()..id = Int64(304)..name = 'i人'..type = 'c',
          UserTag()..id = Int64(305)..name = 'e人'..type = 'c',
          UserTag()..id = Int64(306)..name = '咖啡爱好者'..type = 'c',
          UserTag()..id = Int64(307)..name = '猫奴'..type = 'c',
          UserTag()..id = Int64(308)..name = '狗奴'..type = 'c',
          UserTag()..id = Int64(309)..name = '宅家'..type = 'c',
          UserTag()..id = Int64(310)..name = '户外'..type = 'c',
        ]),
    ]);
}

/// 取标签在 UI 上的唯一键（与 `UpdateMyTagsRequest.tag_ids` 对应）
String effectiveTagId(UserTag tag) => tag.id.toString();

/// 标签列表 Provider
final tagListProvider = FutureProvider<GetTagsResponse>((ref) async {
  final repo = ref.read(authRepositoryProvider);
  try {
    final res = await repo.getTagList(scene: 'complete_profile');
    if (res.groups.isEmpty) {
      return fallbackGetTagsResponse();
    }
    return res;
  } catch (_) {
    return fallbackGetTagsResponse();
  }
});
