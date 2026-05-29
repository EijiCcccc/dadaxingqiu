import 'package:core/colors/colors.dart';
import 'package:flutter/material.dart';

class MessageTabHeader extends StatelessWidget {
  const MessageTabHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgPurple100.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(color: AppColors.borderPurple.withOpacity(0.5)),
        ),
      ),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '消息',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
          ),
        ),
      ),
    );
  }
}
