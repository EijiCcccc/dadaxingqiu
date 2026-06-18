import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

import '../contact_display.dart';

class ContactListItem extends StatelessWidget {
  const ContactListItem({
    super.key,
    required this.item,
    required this.showIntimacy,
    required this.onTap,
  });

  final ContactUserItem item;
  final bool showIntimacy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final genderLabel = contactGenderLabel(item.gender);
    final genderColor = contactGenderColor(item.gender);

    return Material(
      color: Colors.white.withOpacity(0.95),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              _buildAvatar(),
              const SizedBox(width: 12),
              Expanded(child: _buildInfo(genderLabel, genderColor)),
              if (showIntimacy) ...[
                const SizedBox(width: 8),
                _buildIntimacy(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    final avatarUrl = item.avatarUrl;
    return AppNetworkAvatar(
      url: avatarUrl,
      radius: 24,
      backgroundColor: AppColors.bgPurple100,
      fallbackIconColor: AppColors.textMuted,
    );
  }

  Widget _buildInfo(String genderLabel, Color genderColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contactDisplayName(item),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
        if (genderLabel.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            genderLabel,
            style: TextStyle(
              fontSize: 13,
              color: genderColor,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildIntimacy() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accent.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite, size: 14, color: AppColors.accent),
          const SizedBox(width: 4),
          Text(
            '${item.intimacy}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.femalePinkDark,
            ),
          ),
        ],
      ),
    );
  }
}
