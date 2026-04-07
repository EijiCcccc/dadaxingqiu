import 'dart:io';

import 'package:core/core.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:feature_auth/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared/shared.dart';

/// 完善资料页 - 登录后跳转
class CompleteProfilePage extends ConsumerWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.bgPurple100,
                AppColors.bgPink50,
                Colors.white,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildAvatarSection(context, ref),
                        const SizedBox(height: 40),
                        _buildNicknameInput(ref),
                        const SizedBox(height: 32),
                        _buildGenderSection(ref),
                        const SizedBox(height: 32),
                        _buildNextButton(ref),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.bgPurple100.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(color: AppColors.borderPurple.withOpacity(0.5)),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                if (GlobalRouter.instance.canPop()) {
                  GlobalRouter.instance.pop();
                } else {
                  GlobalRouter.instance.go(const LoginRoute());
                }
              },
              icon: const Icon(Icons.arrow_back, color: AppColors.primaryDark),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.borderPurple.withOpacity(0.5),
              ),
            ),
          ),
          const Text(
            '请完善个人资料',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }

  Future<Permission> _getPhotosPermission() async {
    if (!Platform.isAndroid) return Permission.photos;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    return androidInfo.version.sdkInt >= 33 ? Permission.photos : Permission.storage;
  }

  Future<void> _pickAvatar(BuildContext context, WidgetRef ref) async {
    final confirmed = await AppDialog.show(
      context,
      title: '访问相册',
      content: '选择个人头像需要访问您的相册，是否授权？',
      confirmText: '授权',
      cancelText: '取消',
    );
    if (confirmed != true) return;

    final permission = await _getPhotosPermission();
    final status = await permission.request();
    if (!status.isGranted) {
      if (!context.mounted) return;
      if (status.isPermanentlyDenied) {
        final openSettings = await AppDialog.show(
          context,
          title: '需要相册权限',
          content: '请在设置中开启相册权限以选择头像',
          confirmText: '去设置',
          cancelText: '取消',
        );
        if (openSettings == true) {
          await openAppSettings();
        }
      } else {
        AppToast.error('需要相册权限才能选择头像');
      }
      return;
    }

    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
      maxHeight: 400,
      imageQuality: 85,
    );
    if (file != null) {
      ref.read(completeProfileFormProvider.notifier).setAvatar(File(file.path));
    }
  }

  Widget _buildAvatarSection(BuildContext context, WidgetRef ref) {
    final avatarFile = ref.watch(completeProfileFormProvider).avatarFile;
    return Column(
      children: [
        GestureDetector(
          onTap: () => _pickAvatar(context, ref),
          child: Container(
            width: 112,
            height: 112,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryLight,
                width: 2,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.borderPurple.withOpacity(0.5),
                  blurRadius: 16,
                ),
              ],
            ),
            child: ClipOval(
              child: avatarFile != null
                  ? Image.file(
                      avatarFile,
                      fit: BoxFit.cover,
                      width: 112,
                      height: 112,
                    )
                  : const Icon(Icons.person, size: 48, color: AppColors.primaryLight),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          '选择个人头像',
          style: TextStyle(fontSize: 14, color: AppColors.primaryDark),
        ),
      ],
    );
  }

  Widget _buildNicknameInput(WidgetRef ref) {
    final nickname = ref.watch(completeProfileFormProvider).nickname;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '昵称',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          key: const ValueKey('nickname'),
          initialValue: nickname,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
          onChanged: (v) => ref.read(completeProfileFormProvider.notifier).setNickname(v),
          decoration: InputDecoration(
            hintText: '请填写个人昵称',
            hintStyle: const TextStyle(color: AppColors.textMuted),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderPurple),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSection(WidgetRef ref) {
    final gender = ref.watch(completeProfileFormProvider).gender;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '性别',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _GenderButton(
                label: '男',
                isSelected: gender == 'male',
                gradient: const [AppColors.primaryLight, AppColors.primary],
                onTap: () => ref.read(completeProfileFormProvider.notifier).setGender('male'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _GenderButton(
                label: '女',
                isSelected: gender == 'female',
                gradient: const [AppColors.primaryLight, AppColors.accent],
                onTap: () => ref.read(completeProfileFormProvider.notifier).setGender('female'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleNext(WidgetRef ref) {
    final form = ref.read(completeProfileFormProvider);
    if (form.avatarFile == null) {
      AppToast.warning('请完善头像资料');
      return;
    }
    if (form.nickname.trim().isEmpty) {
      AppToast.warning('请完善昵称资料');
      return;
    }
    if (form.gender == null) {
      AppToast.warning('请完善性别资料');
      return;
    }
    ref.read(selectedTagIdsProvider.notifier).reset();
    GlobalRouter.instance.push(const SelectTagsRoute());
  }

  Widget _buildNextButton(WidgetRef ref) {
    return FullWidthBottomActionBar(
      padding: EdgeInsets.zero,
      barDecoration: const BoxDecoration(color: Colors.transparent),
      onPressed: () => _handleNext(ref),
      label: '下一步',
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.label,
    required this.isSelected,
    required this.gradient,
    required this.onTap,
  });

  static const Duration _kAnimDuration = Duration(milliseconds: 320);
  static const Curve _kAnimCurve = Curves.easeOutCubic;

  final String label;
  final bool isSelected;
  final List<Color> gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: _kAnimDuration,
        curve: _kAnimCurve,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          // 始终用同结构的 LinearGradient，便于在选中/未选中之间插值（null↔color 无法平滑过渡）
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: isSelected
                ? gradient
                : const [Colors.white, Colors.white],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.borderPurple,
            width: 1,
          ),
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: _kAnimDuration,
            curve: _kAnimCurve,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.primaryDark,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
