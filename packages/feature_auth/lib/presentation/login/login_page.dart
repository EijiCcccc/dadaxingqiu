import 'package:core/core.dart';
import 'package:feature_auth/data/data.dart';
import 'package:feature_auth/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

/// 登录页 - 搭搭星球
/// 通过 GlobalRouter 跳转，遵循路由规则
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginStateProvider);

    ref.listen<AsyncValue<LoginResult?>>(loginStateProvider, (prev, next) {
      next.whenOrNull(
        data: (result) {
          if (prev != null && prev.isLoading && result != null) {
            if (result.isRegistered) {
              AppToast.success('登录成功');
              GlobalRouter.instance.go(const MainHomeRoute());
            } else {
              GlobalRouter.instance.push(const CompleteProfileRoute());
            }
          }
        },
        error: (err, _) => AppToast.error(err.toString()),
      );
    });

    final isLoading = loginState.isLoading;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF581C87), // purple-900
                  Color(0xFF6B21A8), // purple-800
                  Color(0xFF831843), // pink-900
                ],
              ),
            ),
            child: Stack(
              children: [
                // 星空背景动效
                const _SpaceBackgroundEffect(),
                // 主内容
                SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const _LogoSection(),
                          const SizedBox(height: 32),
                          const _AppNameSection(),
                          const SizedBox(height: 64),
                          _LoginButtons(
                            isLoading: isLoading,
                            onWechatLogin: () => ref
                                .read(loginStateProvider.notifier)
                                .loginWithWechat(),
                            onAppleLogin: () => ref
                                .read(loginStateProvider.notifier)
                                .loginWithApple(),
                          ),
                          const SizedBox(height: 48),
                          const _TermsAndPrivacy(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black26,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

/// 星空背景动效 - 脉动光点
class _SpaceBackgroundEffect extends StatefulWidget {
  const _SpaceBackgroundEffect();

  @override
  State<_SpaceBackgroundEffect> createState() => _SpaceBackgroundEffectState();
}

class _SpaceBackgroundEffectState extends State<_SpaceBackgroundEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return IgnorePointer(
          child: Stack(
            children: [
              _PulsingDot(
                top: 80,
                left: 40,
                size: 8,
                color: const Color(0xFFD8B4FE), // purple-300
                opacity: 0.5 + _controller.value * 0.5,
              ),
              _PulsingDot(
                top: 160,
                right: 80,
                size: 4,
                color: const Color(0xFFF9A8D4), // pink-300
                opacity: 0.5 + _controller.value * 0.5,
              ),
              _PulsingDot(
                top: 240,
                left: MediaQuery.of(context).size.width * 0.25,
                size: 6,
                color: const Color(0xFFE9D5FF), // purple-200
                opacity: 0.5 + _controller.value * 0.5,
              ),
              _PulsingDot(
                bottom: 160,
                right: MediaQuery.of(context).size.width / 3,
                size: 4,
                color: const Color(0xFFFBCFE8), // pink-200
                opacity: 0.5 + _controller.value * 0.5,
              ),
              _PulsingDot(
                bottom: 240,
                left: MediaQuery.of(context).size.width / 2 - 4,
                size: 8,
                color: const Color(0xFFD8B4FE), // purple-300
                opacity: 0.5 + _controller.value * 0.5,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PulsingDot extends StatelessWidget {
  const _PulsingDot({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.size,
    required this.color,
    required this.opacity,
  });

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final Color color;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

/// Logo 区域
class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA855F7).withOpacity(0.5),
            blurRadius: 24,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          appIconAssetPath,
          package: appAssetPackage,
          width: 96,
          height: 96,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// 应用名称
class _AppNameSection extends StatelessWidget {
  const _AppNameSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          appName,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '找到你的星际搭子',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFFE9D5FF), // purple-200
          ),
        ),
      ],
    );
  }
}

/// 登录按钮组
class _LoginButtons extends StatelessWidget {
  const _LoginButtons({
    required this.isLoading,
    required this.onWechatLogin,
    required this.onAppleLogin,
  });

  final bool isLoading;
  final VoidCallback onWechatLogin;
  final VoidCallback onAppleLogin;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          // 微信登录
          SizedBox(
            width: double.infinity,
            height: 56,
            child: FilledButton(
              onPressed: isLoading ? null : onWechatLogin,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF581C87),
                elevation: 8,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble_outline, size: 24, color: Color(0xFF581C87)),
                  SizedBox(width: 8),
                  Text(
                    '微信登录',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Apple 登录
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton(
              onPressed: isLoading ? null : onAppleLogin,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.1),
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withOpacity(0.3)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple, size: 24, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Apple 登录',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 用户协议与隐私政策
class _TermsAndPrivacy extends StatelessWidget {
  const _TermsAndPrivacy();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '登录即同意',
          style: TextStyle(
            fontSize: 12,
            color: Colors.purple.shade200,
          ),
        ),
        TextButton(
          onPressed: () =>
              GlobalRouter.instance.push(const UserAgreementRoute()),
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 4)),
            minimumSize: WidgetStatePropertyAll(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            '《用户协议》',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
        ),
        Text(
          '、',
          style: TextStyle(
            fontSize: 12,
            color: Colors.purple.shade200,
          ),
        ),
        TextButton(
          onPressed: () =>
              GlobalRouter.instance.push(const PrivacyPolicyRoute()),
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 4)),
            minimumSize: WidgetStatePropertyAll(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            '《隐私政策》',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
