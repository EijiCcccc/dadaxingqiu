import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const _LogoSection(),
                      const SizedBox(height: 24),
                      const Text(
                        '搭搭星球',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '版本号：1.0.0',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 64),
                      const Text(
                        '© 2024 搭搭星球 All Rights Reserved',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => GlobalRouter.instance.push(const UserAgreementRoute()),
                            child: const Text(
                              '用户协议',
                              style: TextStyle(color: Color(0xFF7C3AED)),
                            ),
                          ),
                          const Text('·', style: TextStyle(color: Color(0xFF9CA3AF))),
                          TextButton(
                            onPressed: () => GlobalRouter.instance.push(const PrivacyPolicyRoute()),
                            child: const Text(
                              '隐私政策',
                              style: TextStyle(color: Color(0xFF7C3AED)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
            '关于搭搭星球',
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
}

class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFA855F7),
                Color(0xFFEC4899),
                Color(0xFF3B82F6),
              ],
            ),
            borderRadius: BorderRadius.circular(48),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFA855F7).withOpacity(0.5),
                blurRadius: 24,
              ),
            ],
          ),
          child: const Icon(Icons.auto_awesome, size: 48, color: Colors.white),
        ),
        Positioned(
          top: -8,
          right: -8,
          child: Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFACC15), Color(0xFFF97316)],
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -4,
          left: -4,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF60A5FA), Color(0xFF22D3EE)],
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
