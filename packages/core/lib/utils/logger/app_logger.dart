import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// 应用日志工具 - 基于 logger 封装
/// 支持 debug/info/warning/error 等级，release 下可配置是否输出
class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    filter: _AppLogFilter(),
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  /// Debug 日志
  static void d(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Info 日志
  static void i(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Warning 日志
  static void w(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Error 日志
  static void e(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Fatal 日志（带完整堆栈）
  static void f(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }
}

/// 日志过滤器 - release 模式下可关闭 debug/info
class _AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (kReleaseMode) {
      // release 下仅输出 warning 及以上
      return event.level.index >= Level.warning.index;
    }
    return true;
  }
}
