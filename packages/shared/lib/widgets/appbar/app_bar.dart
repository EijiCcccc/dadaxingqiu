import 'package:core/colors/colors.dart';
import 'package:core/router/global_router.dart';
import 'package:flutter/material.dart';

class EditProfileAppBar extends StatelessWidget {
  const EditProfileAppBar({super.key, this.onBack, required this.title});

  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.bgPurple100.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderPurple.withOpacity(0.5),
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                if (onBack != null) {
                  onBack?.call();
                } else {
                  GlobalRouter.instance.pop();
                }
              },
              icon: const Icon(Icons.arrow_back, color: AppColors.primaryDark),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
