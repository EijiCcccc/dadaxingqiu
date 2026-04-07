import 'package:network/network.dart';

/// 头像 URL：优先 `avatarUrl`，其次嵌套 `avatar.url`
String resolveProfileAvatarUrl(UserProfile p) {
  if (p.hasAvatarUrl() && p.avatarUrl.isNotEmpty) return p.avatarUrl;
  if (p.hasAvatar() && p.avatar.hasUrl() && p.avatar.url.isNotEmpty) {
    return p.avatar.url;
  }
  return '';
}

/// 后端 gender：1 男，2 女（与 [AuthRepository.completeProfile] 一致）
int genderToApiValue(String uiGender) => uiGender == 'female' ? 2 : 1;

String genderLabelZh(int gender) {
  switch (gender) {
    case 1:
      return '男';
    case 2:
      return '女';
    default:
      return '';
  }
}
