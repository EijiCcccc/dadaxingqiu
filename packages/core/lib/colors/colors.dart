import 'package:flutter/material.dart';

/// 颜色与主题色常量 - 集中管理
/// 禁止在 feature 包或页面内散落颜色常量
class AppColors {
  AppColors._();

  // 主色
  static const Color primary = Color(0xFF7C3AED);
  static const Color primaryLight = Color(0xFFA855F7);
  static const Color primaryDark = Color(0xFF581C87);

  // 辅助色
  static const Color accent = Color(0xFFEC4899);
  static const Color accentLight = Color(0xFFF472B6);

  // 背景渐变（搭搭星球主题）
  static const Color bgPurple100 = Color(0xFFF3E8FF);
  static const Color bgPink50 = Color(0xFFFDF2F8);

  /// 编辑资料头像描边、强调紫（与渐变区分的亮紫）
  static const Color avatarRingViolet = Color(0xFFC084FC);

  // 边框
  static const Color borderPurple = Color(0xFFE9D5FF);
  static const Color borderGray = Color(0xFFE5E7EB);

  // 文字
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);

  // 性别
  static const Color maleBlue = Color(0xFF3B82F6);
  static const Color maleBlueDark = Color(0xFF2563EB);
  static const Color femalePink = Color(0xFFEC4899);
  static const Color femalePinkDark = Color(0xFFDB2777);

  // 标签背景
  static const Color tagBgGray = Color(0xFFF3F4F6);
  /// 资料页等「浅紫底」标签
  static const Color tagBgSoftPurple = Color(0xFFF5F3FF);

  static const Color lineColor = Color(0xFFE5E7EB);
}
