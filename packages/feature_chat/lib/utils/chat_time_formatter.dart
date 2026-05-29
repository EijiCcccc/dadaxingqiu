/// 消息相关时间展示
class ChatTimeFormatter {
  ChatTimeFormatter._();

  /// 会话列表最近一条消息时间
  static String formatListTime(DateTime time, [DateTime? reference]) {
    final now = reference ?? DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 60) {
      final minutes = diff.inMinutes <= 0 ? 1 : diff.inMinutes;
      return '$minutes分钟前';
    }
    if (_isSameDay(time, now)) {
      return _formatHm(time);
    }
    if (diff.inDays < 7) {
      return '${diff.inDays}天前';
    }
    return '${time.month}月${time.day}日';
  }

  /// 对话页消息间隔时间（距上一条 ≥90 秒时展示）
  static String formatMessageTime(DateTime time, [DateTime? reference]) {
    final now = reference ?? DateTime.now();

    if (_isSameDay(time, now)) {
      return _formatHm(time);
    }
    if (now.difference(time).inDays < 7) {
      return '${_weekdayLabel(time)} ${_formatHm(time)}';
    }
    return '${time.month}月${time.day}日 ${_formatHm(time)}';
  }

  static bool shouldShowMessageTime(DateTime? previous, DateTime current) {
    if (previous == null) return true;
    return current.difference(previous).inSeconds >= 90;
  }

  static String _formatHm(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  static bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static String _weekdayLabel(DateTime time) {
    const labels = ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'];
    return labels[time.weekday - 1];
  }
}
