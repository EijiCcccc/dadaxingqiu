import 'package:core/core.dart';
import 'package:feature_profile/presentation/edit_profile/edit_profile_providers.dart';
import 'package:feature_profile/presentation/profile_tab/my_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared/shared.dart';

export 'package:shared/widgets/gradient_background_widget.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.read(myProfileProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: GradientBackgroundWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const EditProfileAppBar(title: '编辑个人资料'),
            Expanded(
              child: _EditProfileForm(profile: s.profile!),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditProfileForm extends ConsumerStatefulWidget {
  const _EditProfileForm({required this.profile});

  final UserProfile profile;

  @override
  ConsumerState<_EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<_EditProfileForm> {
  late final TextEditingController _nicknameController;

  String get _userId => widget.profile.id.toString();

  @override
  void initState() {
    super.initState();
    final p = widget.profile;
    _nicknameController = TextEditingController(text: p.nickname);
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    if (ref.read(editProfileProvider(_userId)).valueOrNull?.isSubmitting ==
        true) {
      return;
    }
    final nickname = _nicknameController.text.trim();
    if (nickname.isEmpty) {
      AppToast.warning('请填写昵称');
      return;
    }
    try {
      await ref.read(editProfileProvider(_userId).notifier).submitMyProfile(
            nickname: nickname,
          );
      if (!mounted) return;
      AppToast.success('保存成功');
      GlobalRouter.instance.pop();
    } catch (e, st) {
      AppLogger.e('updateMyProfile failed', error: e, stackTrace: st);
      AppToast.error('保存失败，请稍后重试');
    }
  }

  /// 处理头像选择
  Future<void> _pickAvatar(BuildContext context) async {
    final pickerNotifier = ref.read(avatarPickerProvider.notifier);
    final pickerState = ref.read(avatarPickerProvider);

    if (pickerState.isLoading) return;

    // 检查权限状态
    final status = await pickerNotifier.checkPermission();

    if (!status.isGranted) {
      if (!context.mounted) return;

      // 首次请求权限前弹窗确认
      final confirmed = await AppDialog.show(
        context,
        title: '相册权限',
        content: '选择个人头像需要访问您的相册，是否授权？',
        confirmText: '授权',
        cancelText: '取消',
      );
      if (confirmed != true) return;

      final granted = await pickerNotifier.requestPermission();
      if (!granted) {
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
            await pickerNotifier.openSettings();
          }
        } else {
          AppToast.error('需要相册权限才能选择头像');
        }
        return;
      }
    }

    // 权限已授权，选择并上传头像
    final publicUrl = await pickerNotifier.pickAndUploadAvatar();

    if (publicUrl != null) {
      // 更新头像 URL 到编辑状态
      ref.read(editProfileProvider(_userId).notifier).setAvatarUrl(publicUrl);
      AppToast.success('头像上传成功');
    } else {
      final error = ref.read(avatarPickerProvider).error;
      if (error != null) {
        AppToast.error(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final editAsync = ref.watch(editProfileProvider(_userId));

    return editAsync.when(
      data: (edit) => _buildLoadedForm(edit),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: AsyncLoadErrorBody(
          onRetry: () => ref.invalidate(editProfileProvider(_userId)),
        ),
      ),
    );
  }

  Widget _buildLoadedForm(EditProfileState edit) {
    final saving = edit.isSubmitting;

    final avatarDisplay = edit.avatarUrl.isEmpty
        ? const Icon(Icons.person, size: 56, color: AppColors.textMuted)
        : Image.network(
            edit.avatarUrl,
            fit: BoxFit.cover,
            width: 112,
            height: 112,
            errorBuilder: (_, __, ___) => const Icon(
              Icons.person,
              size: 56,
              color: AppColors.textMuted,
            ),
          );

    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            behavior: HitTestBehavior.opaque,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => _pickAvatar(context),
                        child: Container(
                          width: 112,
                          height: 112,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.avatarRingViolet,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.borderPurple.withOpacity(0.5),
                                blurRadius: 16,
                              ),
                            ],
                          ),
                          child: ClipOval(child: avatarDisplay),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '点击替换头像',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _buildNicknameInput(),
                  const SizedBox(height: 32),
                  _buildGenderSection(edit),
                  const SizedBox(height: 32),
                  _buildTagsSection(edit),
                ],
              ),
            ),
          ),
        ),
        FullWidthBottomActionBar(
          loading: saving,
          onPressed: _onSave,
          label: '保存',
          padding: EdgeInsets.fromLTRB(
            24,
            12,
            24,
            12 + MediaQuery.of(context).padding.bottom,
          ),
        ),
      ],
    );
  }

  Widget _buildNicknameInput() {
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
        TextField(
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
          controller: _nicknameController,
          decoration: InputDecoration(
            hintText: '当前昵称',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderPurple),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSection(EditProfileState edit) {
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
              child: _GenderBtn(
                label: '男',
                isSelected: edit.genderUi == 'male',
                gradient: const [AppColors.primaryLight, AppColors.primary],
                onTap: () => ref
                    .read(editProfileProvider(_userId).notifier)
                    .setGender('male'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _GenderBtn(
                label: '女',
                isSelected: edit.genderUi == 'female',
                gradient: const [AppColors.primaryLight, AppColors.accent],
                onTap: () => ref
                    .read(editProfileProvider(_userId).notifier)
                    .setGender('female'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTagsSection(EditProfileState edit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '个人标签',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryDark,
              ),
            ),
            TextButton(
              onPressed: () =>
                  GlobalRouter.instance.push(const EditTagsRoute()),
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
              child: const Text('修改'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderPurple, width: 1),
          ),
          child: edit.tagNames.isEmpty
              ? const Center(
                  child: Text(
                    '暂无标签，点击「修改」添加',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                )
              : Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: edit.tagNames
                      .map(
                        (tag) => TagPill(
                          label: tag,
                          style: TagPillStyle.editProfileGradient,
                        ),
                      )
                      .toList(),
                ),
        ),
      ],
    );
  }
}

/// 与完善资料（注册）页性别按钮一致：渐变可插值 + 文案颜色动画
class _GenderBtn extends StatelessWidget {
  const _GenderBtn({
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
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: isSelected ? gradient : const [Colors.white, Colors.white],
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
