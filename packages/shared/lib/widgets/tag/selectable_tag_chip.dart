import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// 可切换选中/未选中的标签（选择标签、编辑标签等）
class SelectableTagChip extends StatelessWidget {
  const SelectableTagChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutCubic,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: duration,
        curve: curve,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: selected
                ? const [AppColors.primaryLight, AppColors.accent]
                : const [Colors.white, Colors.white],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? Colors.transparent : AppColors.borderPurple,
            width: 1,
          ),
        ),
        child: AnimatedDefaultTextStyle(
          duration: duration,
          curve: curve,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : AppColors.primaryDark,
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
