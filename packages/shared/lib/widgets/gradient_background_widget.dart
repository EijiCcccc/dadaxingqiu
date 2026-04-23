import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// 渐变背景容器 Widget
///
/// 默认使用紫色 → 粉色 → 白色的渐变背景，常用于编辑资料、设置等页面
///
/// 使用示例：
/// ```dart
/// Scaffold(
///   backgroundColor: Colors.transparent,
///   body: GradientBackgroundWidget(
///     child: Column(
///       children: [
///         const CustomAppBar(title: '页面标题'),
///         Expanded(child: YourPageContent()),
///       ],
///     ),
///   ),
/// )
/// ```
class GradientBackgroundWidget extends StatelessWidget {
  const GradientBackgroundWidget({
    super.key,
    required this.child,
    this.colors,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.padding,
  });

  /// 子 Widget
  final Widget child;

  /// 渐变颜色列表，默认为 [bgPurple100, bgPink50, Colors.white]
  final List<Color>? colors;

  /// 渐变起始位置，默认为顶部居中
  final Alignment begin;

  /// 渐变结束位置，默认为底部居中
  final Alignment end;

  /// 内边距，默认只添加顶部安全区域 padding
  final EdgeInsetsGeometry? padding;

  /// 默认渐变颜色
  static const List<Color> defaultColors = [
    AppColors.bgPurple100,
    AppColors.bgPink50,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors ?? defaultColors,
        ),
      ),
      child: child,
    );
  }
}
