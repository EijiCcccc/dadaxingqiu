import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';

class ChatAttachmentPanel extends StatelessWidget {
  const ChatAttachmentPanel({
    super.key,
    required this.onAlbumTap,
    required this.onCameraTap,
  });

  final VoidCallback onAlbumTap;
  final VoidCallback onCameraTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        border: Border(
          top: BorderSide(color: AppColors.borderPurple.withOpacity(0.3)),
        ),
      ),
      child: Row(
        children: [
          _AttachmentItem(
            icon: Icons.photo_library_outlined,
            label: '相册',
            onTap: onAlbumTap,
          ),
          const SizedBox(width: 32),
          _AttachmentItem(
            icon: Icons.photo_camera_outlined,
            label: '拍摄',
            onTap: onCameraTap,
          ),
        ],
      ),
    );
  }
}

class _AttachmentItem extends StatelessWidget {
  const _AttachmentItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.bgPurple100,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderPurple.withOpacity(0.4)),
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
