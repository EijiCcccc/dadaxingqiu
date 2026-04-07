import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAgreementPage extends ConsumerWidget {
  const UserAgreementPage({super.key});

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
                    _section('欢迎使用搭搭星球', '在使用搭搭星球服务之前，请您仔细阅读并充分理解本协议。您点击"同意"或使用搭搭星球服务，即表示您已阅读并同意接受本协议的全部内容。'),
                    _section('1. 服务说明', '搭搭星球是一个面向年轻人的社交平台，旨在帮助用户寻找志同道合的伙伴。我们提供用户资料展示、消息交流等功能。'),
                    _section('2. 用户行为规范', '用户在使用搭搭星球服务时，应遵守法律法规，不得发布违法、违规、不良信息。用户应对自己的行为负责，不得侵犯他人合法权益。'),
                    _section('3. 隐私保护', '我们重视用户隐私保护。请您仔细阅读我们的《隐私政策》了解我们如何收集、使用和保护您的个人信息。'),
                    _section('4. 免责声明', '搭搭星球仅作为社交平台，对用户之间的交流行为不承担责任。用户应对自己的言行负责，并自行承担由此产生的一切后果。'),
                    _section('5. 协议修改', '我们有权根据需要修改本协议。修改后的协议将在应用内公布，继续使用服务即视为接受修改后的协议。'),
                    const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Divider(),
                    ),
                    const Text(
                      '本协议最后更新时间：2024年3月10日',
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
            '用户协议',
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
