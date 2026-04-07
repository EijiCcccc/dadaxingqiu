import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Toast 弹窗工具 - 基于 fluttertoast 封装
/// 无需 BuildContext，可在任意位置调用
class AppToast {
  AppToast._();

  /// 显示 Toast
  /// [msg] 文案
  /// [length] 时长：short 约 1s，long 约 5s
  /// [gravity] 位置：bottom / center / top
  static void show(
    String msg, {
    Toast length = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color? backgroundColor,
    Color? textColor,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: length,
      timeInSecForIosWeb: length == Toast.LENGTH_LONG ? 5 : 2,
      gravity: gravity,
      backgroundColor: backgroundColor ?? Colors.black87,
      textColor: textColor ?? Colors.white,
      fontSize: fontSize,
    );
  }

  /// 短时 Toast（约 2 秒）
  static void short(String msg) => show(msg, length: Toast.LENGTH_SHORT);

  /// 长时 Toast（约 5 秒）
  static void long(String msg) => show(msg, length: Toast.LENGTH_LONG);

  /// 底部 Toast（默认）
  static void bottom(String msg) => show(msg, gravity: ToastGravity.BOTTOM);

  /// 居中 Toast
  static void center(String msg) => show(msg, gravity: ToastGravity.CENTER);

  /// 顶部 Toast
  static void top(String msg) => show(msg, gravity: ToastGravity.TOP);

  /// 成功样式（可选自定义颜色）
  static void success(String msg, {Color? backgroundColor}) => show(
        msg,
        backgroundColor: backgroundColor ?? const Color(0xFF4CAF50),
        textColor: Colors.white,
      );

  /// 错误样式
  static void error(String msg, {Color? backgroundColor}) => show(
        msg,
        backgroundColor: backgroundColor ?? const Color(0xFFF44336),
        textColor: Colors.white,
      );

  /// 警告样式
  static void warning(String msg, {Color? backgroundColor}) => show(
        msg,
        backgroundColor: backgroundColor ?? const Color(0xFFFF9800),
        textColor: Colors.white,
      );

  /// 取消当前 Toast
  static void cancel() => Fluttertoast.cancel();
}
