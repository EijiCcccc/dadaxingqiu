class ChatVoiceBarUtils {
  ChatVoiceBarUtils._();

  static const double minWidth = 80;
  static const double maxWidth = 220;
  static const int maxDurationSec = 60;

  static double barWidth(int? durationSec) {
    final seconds = (durationSec ?? 1).clamp(1, maxDurationSec);
    return minWidth + (maxWidth - minWidth) * (seconds / maxDurationSec);
  }

  static String formatDuration(int? seconds) {
    final value = (seconds ?? 0).clamp(0, maxDurationSec);
    return '$value″';
  }
}
