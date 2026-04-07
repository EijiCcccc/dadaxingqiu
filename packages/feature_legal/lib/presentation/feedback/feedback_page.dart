import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

class FeedbackPage extends ConsumerStatefulWidget {
  const FeedbackPage({super.key});

  @override
  ConsumerState<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends ConsumerState<FeedbackPage> {
  final _feedbackController = TextEditingController();
  final _contactController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      '您的反馈',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _feedbackController,
                      maxLines: 6,
                      maxLength: 500,
                      decoration: InputDecoration(
                        hintText: '请告诉我们您的意见或建议...',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      '联系方式（选填）',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _contactController,
                      decoration: InputDecoration(
                        hintText: '邮箱或手机号，以便我们回复您',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 32),
                    FullWidthBottomActionBar(
                      padding: EdgeInsets.zero,
                      barDecoration: const BoxDecoration(color: Colors.transparent),
                      onPressed: _feedbackController.text.trim().isEmpty ||
                              _feedbackController.text.length > 500
                          ? null
                          : () {
                              AppToast.success('感谢您的反馈！');
                              GlobalRouter.instance.pop();
                            },
                      label: '提交反馈',
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F3FF),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE9D5FF)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '温馨提示',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '• 我们会认真查看每一条反馈\n'
                            '• 留下联系方式可以获得问题处理进度通知\n'
                            '• 请勿提交包含个人敏感信息的内容',
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.6,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
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
            '意见反馈',
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
