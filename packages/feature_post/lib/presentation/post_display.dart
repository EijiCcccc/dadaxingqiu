import 'package:flutter/material.dart';
import 'package:network/network.dart';

String postAuthorAvatar(PostAuthorRelation author) => author.avatarUrl;

String postAuthorName(PostAuthorRelation author) {
  return author.nickname.isEmpty ? '未知用户' : author.nickname;
}

String postGenderLabel(int gender) {
  switch (gender) {
    case 1:
      return '男';
    case 2:
      return '女';
    default:
      return '';
  }
}

Color postGenderColor(int gender) {
  switch (gender) {
    case 1:
      return const Color(0xFF3B82F6);
    case 2:
      return const Color(0xFFEC4899);
    default:
      return const Color(0xFF9CA3AF);
  }
}

DateTime postDateTimeFromEpoch(int value) {
  if (value > 1000000000000) {
    return DateTime.fromMillisecondsSinceEpoch(value);
  }
  return DateTime.fromMillisecondsSinceEpoch(value * 1000);
}

String postTimeAgo(int value) {
  final createdAt = postDateTimeFromEpoch(value);
  final diff = DateTime.now().difference(createdAt);
  if (diff.inMinutes < 1) return '刚刚';
  if (diff.inMinutes < 60) return '${diff.inMinutes}分钟前';
  if (diff.inHours < 24) return '${diff.inHours}小时前';
  if (diff.inDays < 30) return '${diff.inDays}天前';
  return '${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}';
}

String postVisibilityLabel(PostVisibility visibility) {
  switch (visibility) {
    case PostVisibility.PUBLIC:
      return '所有人可见';
    case PostVisibility.FRIENDS_ONLY:
      return '仅好友可见';
    case PostVisibility.SQUARE_ONLY:
      return '仅广场可见';
    case PostVisibility.SELF_ONLY:
      return '仅自己可见';
    case PostVisibility.UNSPECIFIED:
      return '所有人可见';
  }
  return '所有人可见';
}

PostVisibility postVisibilityFromKey(String value) {
  switch (value) {
    case 'friends':
      return PostVisibility.FRIENDS_ONLY;
    case 'square':
      return PostVisibility.SQUARE_ONLY;
    case 'private':
      return PostVisibility.SELF_ONLY;
    case 'public':
    default:
      return PostVisibility.PUBLIC;
  }
}

String postVisibilityKey(PostVisibility visibility) {
  switch (visibility) {
    case PostVisibility.FRIENDS_ONLY:
      return 'friends';
    case PostVisibility.SQUARE_ONLY:
      return 'square';
    case PostVisibility.SELF_ONLY:
      return 'private';
    case PostVisibility.PUBLIC:
    case PostVisibility.UNSPECIFIED:
      return 'public';
  }
  return 'public';
}

String postNotificationLabel(PostNotificationType type) {
  switch (type) {
    case PostNotificationType.POST_LIKED:
      return '赞了你的动态';
    case PostNotificationType.POST_COMMENTED:
      return '评论了你的动态';
    case PostNotificationType.COMMENT_REPLIED:
      return '回复了你的评论';
  }
  return '动态通知';
}
