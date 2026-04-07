import 'package:feature_chat/feature_chat.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_profile/feature_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 主首页壳：底部 Tab，由主工程组装各 feature 的 Tab 内容
class MainHomePage extends ConsumerStatefulWidget {
  const MainHomePage({super.key});

  @override
  ConsumerState<MainHomePage> createState() => _MainHomePageState();
}

enum _HomeTab { planet, message, profile }

class _MainHomePageState extends ConsumerState<MainHomePage> {
  _HomeTab _activeTab = _HomeTab.planet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF3E8FF),
              Color(0xFFFDF2F8),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: _activeTab.index,
                sizing: StackFit.expand,
                children: const [
                  PlanetTab(),
                  MessageTab(),
                  ProfileTab(),
                ],
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E8FF).withOpacity(0.8),
        border: Border(
          top: BorderSide(color: const Color(0xFFE9D5FF).withOpacity(0.5)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: _TabItem(
                icon: Icons.public,
                label: '星球',
                isActive: _activeTab == _HomeTab.planet,
                onTap: () => setState(() => _activeTab = _HomeTab.planet),
              ),
            ),
            Expanded(
              child: _TabItem(
                icon: Icons.chat_bubble_outline,
                label: '消息',
                isActive: _activeTab == _HomeTab.message,
                onTap: () => setState(() => _activeTab = _HomeTab.message),
              ),
            ),
            Expanded(
              child: _TabItem(
                icon: Icons.person_outline,
                label: '我的',
                isActive: _activeTab == _HomeTab.profile,
                onTap: () {
                  // 每次点「我的」都重新拉取资料（含已停留在该 Tab 时再次点击）
                  ref.invalidate(myProfileProvider);
                  if (_activeTab != _HomeTab.profile) {
                    setState(() => _activeTab = _HomeTab.profile);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  /// 最小高度 48（Material 建议触摸目标），整格可点
  static const double _minTapHeight = 52;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: double.infinity,
        height: _minTapHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isActive ? const Color(0xFF7C3AED) : const Color(0xFF9CA3AF),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? const Color(0xFF7C3AED) : const Color(0xFF9CA3AF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
