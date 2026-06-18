import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';

class ChatIntimacyBadge extends StatelessWidget {
  const ChatIntimacyBadge({
    super.key,
    required this.intimacy,
    required this.onTap,
  });

  final int intimacy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.accent.withOpacity(0.15),
                AppColors.femalePinkDark.withOpacity(0.12),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.accent.withOpacity(0.35)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite,
                size: 16,
                color: AppColors.accent,
              ),
              const SizedBox(width: 4),
              Text(
                '$intimacy',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.femalePinkDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
