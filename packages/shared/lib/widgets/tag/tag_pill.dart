import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// 只读标签展示样式（探索卡片 / 资料页等）
enum TagPillStyle {
  /// 探索卡片：灰底小字
  exploreCard,

  /// 「我的」头部：浅紫底小字
  profileHeaderCompact,

  /// 用户资料区块：浅紫底中等字
  profileSection,

  /// 编辑资料页：渐变「已选」样式
  editProfileGradient,
}

/// 只读标签
class TagPill extends StatelessWidget {
  const TagPill({
    super.key,
    required this.label,
    required this.style,
  });

  final String label;
  final TagPillStyle style;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case TagPillStyle.exploreCard:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.tagBgGray,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderGray),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        );
      case TagPillStyle.profileHeaderCompact:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.tagBgSoftPurple,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.borderPurple.withOpacity(0.5),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.primary,
            ),
          ),
        );
      case TagPillStyle.profileSection:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.tagBgSoftPurple,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.borderPurple),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.primary,
            ),
          ),
        );
      case TagPillStyle.editProfileGradient:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColors.primaryLight, AppColors.accent],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.transparent, width: 1),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        );
    }
  }
}
