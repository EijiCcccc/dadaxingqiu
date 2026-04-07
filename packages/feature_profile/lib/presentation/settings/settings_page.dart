import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '亮色主题',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF111827),
                            ),
                          ),
                          Switch(
                            value: true,
                            onChanged: (_) {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: Column(
                        children: [
                          _SettingsItem(
                            title: '隐私政策',
                            onTap: () => GlobalRouter.instance.push(const PrivacyPolicyRoute()),
                          ),
                          const Divider(height: 1),
                          _SettingsItem(
                            title: '用户协议',
                            onTap: () => GlobalRouter.instance.push(const UserAgreementRoute()),
                          ),
                          const Divider(height: 1),
                          _SettingsItem(
                            title: '意见反馈',
                            onTap: () => GlobalRouter.instance.push(const FeedbackRoute()),
                          ),
                          const Divider(height: 1),
                          _SettingsItem(
                            title: '关于搭搭星球',
                            onTap: () => GlobalRouter.instance.push(const AboutRoute()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFF9FAFB).withOpacity(0.5),
                    const Color(0xFFF9FAFB),
                  ],
                ),
              ),
              child: SafeArea(
                child: OutlinedButton(
                  onPressed: () => _showLogoutDialog(context, ref),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF111827),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    side: const BorderSide(color: Color(0xFFE5E7EB)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('退出登录'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.white.withOpacity(0.8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => GlobalRouter.instance.pop(),
              icon: const Icon(Icons.arrow_back, color: Color(0xFF111827)),
            ),
          ),
          const Text(
            '设置',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context, WidgetRef ref) async {
    final result = await AppDialog.show(
      context,
      title: '确认退出',
      content: '确认要退出当前账号？',
      confirmText: '确定',
      cancelText: '取消',
    );
    if (result == true) {
      final storage = ref.read(keyValueStorageProvider);
      await storage.remove(StorageKeys.userToken);
      await storage.remove(StorageKeys.userId);
      if (context.mounted) {
        GlobalRouter.instance.go(const LoginRoute());
        AppToast.success('已退出登录');
      }
    }
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF111827),
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Color(0xFF9CA3AF)),
      onTap: onTap,
    );
  }
}
