import 'dart:io';

import 'package:feature_auth/presentation/select_tags/selected_tag_ids_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'complete_profile_form_editing.dart';

/// 完善资料表单状态（CompleteProfilePage 编辑 + SelectTagsPage 提交时读取）
final completeProfileFormProvider =
    NotifierProvider<CompleteProfileFormEditingNotifier, CompleteProfileFormEditing>(
  CompleteProfileFormEditingNotifier.new,
);

class CompleteProfileFormEditingNotifier extends Notifier<CompleteProfileFormEditing> {
  @override
  CompleteProfileFormEditing build() => const CompleteProfileFormEditing();

  void setAvatar(File? file) => state = state.copyWith(avatarFile: file);
  void setNickname(String v) => state = state.copyWith(nickname: v);
  void setGender(String? v) => state = state.copyWith(gender: v);
  void reset() => state = const CompleteProfileFormEditing();
}

/// 表单是否已完善（头像、昵称、性别均已填写）
final isCompleteProfileFormReadyProvider = Provider<bool>((ref) {
  final form = ref.watch(completeProfileFormProvider);
  return form.avatarFile != null &&
      form.nickname.trim().isNotEmpty &&
      form.gender != null;
});

/// 完善资料提交校验结果
enum CompleteProfileSubmitValidation {
  ok,
  formIncomplete,
  noTagsSelected,
}

/// 完善资料提交校验：表单 + 标签选择
final completeProfileSubmitValidationProvider =
    Provider<CompleteProfileSubmitValidation>((ref) {
  final formReady = ref.watch(isCompleteProfileFormReadyProvider);
  final selectedIds = ref.watch(selectedTagIdsProvider);
  if (!formReady) return CompleteProfileSubmitValidation.formIncomplete;
  if (selectedIds.isEmpty) return CompleteProfileSubmitValidation.noTagsSelected;
  return CompleteProfileSubmitValidation.ok;
});
