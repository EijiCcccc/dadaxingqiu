import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// 底部全宽主操作条：渐变背景 + 圆角 [FilledButton]，可选提交中状态。
///
/// 使用 [barDecoration] 可自定义整条背景（如多色渐变）；使用 [padding] 可适配安全区等。
/// 在滚动内容内使用时可将 [padding] 设为 [EdgeInsets.zero]、[barDecoration] 设为透明底。
class FullWidthBottomActionBar extends StatelessWidget {
  const FullWidthBottomActionBar({
    super.key,
    required this.onPressed,
    required this.label,
    this.loading = false,
    this.gradientColors,
    this.buttonStyle,
    this.padding = const EdgeInsets.fromLTRB(24, 16, 24, 24),
    this.barDecoration,
  });

  final VoidCallback? onPressed;
  final String label;

  /// 为 true 时按钮禁用并显示小号 [CircularProgressIndicator]
  final bool loading;

  /// 背景渐变（二色竖直渐变）；在 [barDecoration] 为 null 时生效；为 null 则用浅灰默认
  final List<Color>? gradientColors;

  /// 为 null 时使用主题紫主按钮样式
  final ButtonStyle? buttonStyle;

  /// 外层 [Container] 内边距
  final EdgeInsetsGeometry padding;

  /// 若设置则作为外层装饰，**覆盖** [gradientColors] 的默认渐变
  final BoxDecoration? barDecoration;

  static List<Color> _defaultGradientColors() => [
        const Color(0xFFF9FAFB).withOpacity(0.5),
        const Color(0xFFF9FAFB),
      ];

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = loading ? null : onPressed;
    final defaultStyle = FilledButton.styleFrom(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
    );

    final decoration = barDecoration ??
        BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0),
              AppColors.bgPink50.withOpacity(0.95),
              AppColors.bgPurple100.withOpacity(0.5),
            ],
          ),
        );

    return Container(
      width: double.infinity,
      padding: padding,
      decoration: decoration,
      child: FilledButton(
        onPressed: effectiveOnPressed,
        style: buttonStyle ?? defaultStyle,
        child: loading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(label),
      ),
    );
  }
}
