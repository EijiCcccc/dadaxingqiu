import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrivacyPolicyPage extends ConsumerWidget {
  const PrivacyPolicyPage({super.key});

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
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _section('隐私政策', '搭搭星球（以下简称"我们"）非常重视您的隐私保护。本隐私政策将帮助您了解我们如何收集、使用和保护您的个人信息。'),
                    _section('1. 信息收集', '我们会收集您主动提供的信息，包括但不限于：昵称、性别、头像、个人标签等。这些信息用于创建您的个人资料，以便其他用户了解您。'),
                    _section('2. 信息使用', '我们收集的信息将用于：提供和改进服务、展示个人资料、实现用户匹配、处理消息通信等功能。'),
                    _section('3. 信息保护', '我们采取合理的技术和管理措施保护您的个人信息安全，防止信息泄露、滥用或未经授权访问。'),
                    _section('4. 信息共享', '除法律法规要求外，我们不会向第三方分享您的个人信息。您的公开资料（如昵称、头像、标签）将对其他用户可见。'),
                    _section('5. 您的权利', '您有权访问、修改、删除您的个人信息。如需行使这些权利，请通过应用内的相关功能操作或联系我们。'),
                    _section('6. 政策更新', '我们可能会不时更新本隐私政策。更新后的政策将在应用内公布，继续使用服务即视为接受更新后的政策。'),
                    const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Divider(),
                    ),
                    const Text(
                      '本隐私政策最后更新时间：2024年3月10日',
                      style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
                    ),
                  ],
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
            '隐私政策',
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

  Widget _section(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}
