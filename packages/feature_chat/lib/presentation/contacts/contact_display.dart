import 'package:flutter/material.dart';
import 'package:network/network.dart';

String contactDisplayName(ContactUserItem item) {
  if (item.displayName.isNotEmpty) {
    return item.displayName;
  }
  if (item.remarkName.isNotEmpty) {
    return item.remarkName;
  }
  if (item.nickname.isNotEmpty) {
    return item.nickname;
  }
  return '未知用户';
}

String contactGenderLabel(int gender) {
  switch (gender) {
    case 1:
      return '男';
    case 2:
      return '女';
    default:
      return '';
  }
}

Color contactGenderColor(int gender) {
  switch (gender) {
    case 1:
      return const Color(0xFF3B82F6);
    case 2:
      return const Color(0xFFEC4899);
    default:
      return const Color(0xFF9CA3AF);
  }
}
