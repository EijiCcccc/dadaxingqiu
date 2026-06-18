import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ChatMessageAvatar extends StatelessWidget {
  const ChatMessageAvatar({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return AppNetworkAvatar(
      url: url,
      radius: 20,
      backgroundColor: AppColors.borderGray,
      fallbackIconColor: AppColors.textMuted,
      fallbackIconSize: 20,
    );
  }
}
