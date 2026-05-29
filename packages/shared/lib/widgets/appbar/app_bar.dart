import 'package:core/colors/colors.dart';
import 'package:core/router/global_router.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key, this.onBack, required this.title, this.actions, this.backgroundColor, this.textColor, this.borderColor});

  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.bgPurple100.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(
            color: borderColor ?? AppColors.borderPurple.withOpacity(0.5),
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
              icon: Icon(Icons.arrow_back, color: textColor ?? AppColors.primaryDark),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textColor ?? AppColors.primaryDark,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: actions != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions!,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
