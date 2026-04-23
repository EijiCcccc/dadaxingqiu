import 'package:core/core.dart';
import 'package:feature_profile/presentation/edit_profile/edit_profile_providers.dart';
import 'package:feature_profile/presentation/edit_tags/edit_tags_state.dart';
import 'package:feature_profile/presentation/profile_tab/my_profile_provider.dart';
import 'package:feature_profile/providers/profile_repository_provider.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

export 'edit_tags_state.dart';

/// 编辑标签页所需：标签分组 + 当前用户资料（用于初始选中）
///
/// 我的资料走 [myProfileProvider]，避免与「我的」等入口重复请求 `getMyProfile`。
final editTagsBootstrapProvider = FutureProvider.autoDispose<
    ({GetTagsResponse catalog, UserProfile profile})>((ref) async {
  final repo = ref.watch(profileRepositoryProvider);
  final catalog = await repo.getTagList();
  final profile = await ref.read(myProfileProvider.notifier).ensureLoaded();
  return (catalog: catalog, profile: profile);
});

class EditTagsNotifier extends AutoDisposeFamilyNotifier<EditTagsState, Int64> {
  @override
  EditTagsState build(Int64 arg) {
    final data = ref.read(editTagsBootstrapProvider).valueOrNull;
    if (data == null || data.profile.id != arg) {
      return const EditTagsState(selectedIds: <Int64>{});
    }
    return EditTagsState(
      selectedIds: {for (final t in data.profile.tags) t.id},
    );
  }

  void toggle(Int64 id) {
    final next = Set<Int64>.from(state.selectedIds);
    if (next.contains(id)) {
      next.remove(id);
    } else {
      next.add(id);
    }
    state = state.copyWith(selectedIds: next);
  }

  Future<void> confirm() async {
    final data = ref.read(editTagsBootstrapProvider).valueOrNull;
    if (data == null) return;
    final groups = data.catalog.groups;
    final err = validateTagSelection(groups, state.selectedIds);
    if (err != null) {
      AppToast.warning(err);
      return;
    }
    if (state.saving) return;
    state = state.copyWith(saving: true);
    try {
      final repo = ref.read(profileRepositoryProvider);
      await repo.updateMyTags(tagIds: state.selectedIds.toList());
      ref.read(myProfileProvider.notifier).refresh();
      ref.invalidate(editProfileProvider(data.profile.id.toString()));
      ref.invalidate(editTagsBootstrapProvider);
      AppToast.success('已保存');
      GlobalRouter.instance.pop();
    } catch (e, st) {
      AppLogger.e('updateMyTags failed', error: e, stackTrace: st);
      AppToast.error('保存失败，请稍后重试');
    } finally {
      state = state.copyWith(saving: false);
    }
  }
}

/// [profileId] 为 [UserProfile.id]
final editTagsProvider =
    NotifierProvider.autoDispose.family<EditTagsNotifier, EditTagsState, Int64>(
  EditTagsNotifier.new,
);
