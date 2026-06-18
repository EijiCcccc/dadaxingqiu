import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// 带磁盘/内存缓存的网络图片，统一加载中与失败占位。
class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.color,
    this.colorBlendMode,
  });

  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Color? color;
  final BlendMode? colorBlendMode;

  bool get _hasUrl => url.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final Widget content;
    if (!_hasUrl) {
      content = errorWidget ?? _defaultError();
    } else {
      content = CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: color,
        colorBlendMode: colorBlendMode,
        placeholder: (_, __) => placeholder ?? _defaultPlaceholder(),
        errorWidget: (_, __, ___) => errorWidget ?? _defaultError(),
      );
    }

    return _wrap(content);
  }

  Widget _wrap(Widget child) {
    Widget result = SizedBox(width: width, height: height, child: child);
    if (borderRadius != null) {
      result = ClipRRect(borderRadius: borderRadius!, child: result);
    }
    return result;
  }

  Widget _defaultPlaceholder() {
    return const ColoredBox(
      color: AppColors.tagBgGray,
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }

  Widget _defaultError() {
    return const ColoredBox(
      color: AppColors.tagBgGray,
      child: Center(
        child: Icon(
          Icons.broken_image_outlined,
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}

/// 圆形网络头像，内部使用 [AppNetworkImage] 处理加载与失败占位。
class AppNetworkAvatar extends StatelessWidget {
  const AppNetworkAvatar({
    super.key,
    required this.url,
    required this.radius,
    this.backgroundColor,
    this.fallbackIcon = Icons.person,
    this.fallbackIconColor,
    this.fallbackIconSize,
  });

  final String url;
  final double radius;
  final Color? backgroundColor;
  final IconData fallbackIcon;
  final Color? fallbackIconColor;
  final double? fallbackIconSize;

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;
    final iconSize = fallbackIconSize ?? radius;
    final bg = backgroundColor ?? AppColors.tagBgGray;
    final fallback = Icon(
      fallbackIcon,
      size: iconSize,
      color: fallbackIconColor ?? AppColors.textMuted,
    );

    return CircleAvatar(
      radius: radius,
      backgroundColor: bg,
      child: ClipOval(
        child: AppNetworkImage(
          url: url,
          width: size,
          height: size,
          fit: BoxFit.cover,
          placeholder: ColoredBox(
            color: bg,
            child: Center(
              child: SizedBox(
                width: iconSize * 0.6,
                height: iconSize * 0.6,
                child: const CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
          errorWidget: fallback,
        ),
      ),
    );
  }
}
