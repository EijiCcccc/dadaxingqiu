import 'package:fixnum/fixnum.dart';
import 'package:network/network.dart';

/// 校验分组 min/max/required（与后端 [TagGroup] 约定一致）
String? validateTagSelection(List<TagGroup> groups, Set<Int64> selectedIds) {
  if (selectedIds.isEmpty) {
    return '请至少选择一个标签';
  }
  for (final g in groups) {
    final idsInGroup = g.items.map((t) => t.id).toSet();
    final count = selectedIds.where((id) => idsInGroup.contains(id)).length;
    final title = g.title.isNotEmpty ? g.title : g.type;
    if (g.hasRequired() &&
        g.required &&
        g.hasMinSelect() &&
        g.minSelect > 0 &&
        count < g.minSelect) {
      return '「$title」至少选择 ${g.minSelect} 个';
    }
    if (g.hasMaxSelect() && g.maxSelect > 0 && count > g.maxSelect) {
      return '「$title」最多选择 ${g.maxSelect} 个';
    }
  }
  return null;
}

class EditTagsState {
  const EditTagsState({
    required this.selectedIds,
    this.saving = false,
  });

  final Set<Int64> selectedIds;
  final bool saving;

  EditTagsState copyWith({
    Set<Int64>? selectedIds,
    bool? saving,
  }) {
    return EditTagsState(
      selectedIds: selectedIds ?? this.selectedIds,
      saving: saving ?? this.saving,
    );
  }
}
