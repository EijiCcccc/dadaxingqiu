import 'dart:io';

/// 完善资料表单编辑状态（填写过程中的中间状态）
class CompleteProfileFormEditing {
  const CompleteProfileFormEditing({
    this.avatarFile,
    this.nickname = '',
    this.gender,
  });

  final File? avatarFile;
  final String nickname;
  final String? gender; // 'male' | 'female'

  CompleteProfileFormEditing copyWith({
    File? avatarFile,
    String? nickname,
    String? gender,
  }) =>
      CompleteProfileFormEditing(
        avatarFile: avatarFile ?? this.avatarFile,
        nickname: nickname ?? this.nickname,
        gender: gender ?? this.gender,
      );
}
