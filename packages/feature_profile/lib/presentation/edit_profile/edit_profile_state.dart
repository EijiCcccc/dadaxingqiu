/// 编辑资料页 UI 状态（无 Provider 声明，见 [editProfileProvider]）
class EditProfileState {
  const EditProfileState({
    required this.tagNames,
    required this.avatarUrl,
    required this.genderUi,
    this.isSubmitting = false,
  });

  final List<String> tagNames;
  final String avatarUrl;
  /// UI：`male` | `female`
  final String genderUi;
  final bool isSubmitting;

  static const empty = EditProfileState(
    tagNames: [],
    avatarUrl: '',
    genderUi: 'male',
    isSubmitting: false,
  );

  EditProfileState copyWith({
    List<String>? tagNames,
    String? avatarUrl,
    String? genderUi,
    bool? isSubmitting,
  }) {
    return EditProfileState(
      tagNames: tagNames ?? this.tagNames,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      genderUi: genderUi ?? this.genderUi,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
