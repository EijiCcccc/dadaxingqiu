import 'package:core/core.dart';
import 'package:feature_auth/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

/// 选择标签页
class SelectTagsPage extends ConsumerWidget {
  const SelectTagsPage({super.key});

  Future<void> _handleSubmit(BuildContext context, WidgetRef ref) async {
    final validation = ref.read(completeProfileSubmitValidationProvider);
    switch (validation) {
      case CompleteProfileSubmitValidation.formIncomplete:
        AppToast.error('请先完善个人资料');
        return;
      case CompleteProfileSubmitValidation.noTagsSelected:
        AppToast.warning('请至少选择一个标签');
        return;
      case CompleteProfileSubmitValidation.ok:
        break;
    }

    final form = ref.read(completeProfileFormProvider);
    final selectedIds = ref.read(selectedTagIdsProvider);
    final repo = ref.read(authRepositoryProvider);
    try {
      final avatarUrl = await repo.uploadAvatar(form.avatarFile!);
      await repo.completeProfile(
        avatarUrl: avatarUrl,
        nickname: form.nickname.trim(),
        gender: form.gender!,
        tagIds: selectedIds.toList(),
      );
      ref.read(completeProfileFormProvider.notifier).reset();
      if (!context.mounted) return;
      AppToast.success('资料完善成功');
      GlobalRouter.instance.go(const MainHomeRoute());
    } catch (e, st) {
      AppLogger.e('完善资料失败', error: e, stackTrace: st);
      if (context.mounted) AppToast.error(e.toString());
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagListAsync = ref.watch(tagListProvider);
    final selectedTagIds = ref.watch(selectedTagIdsProvider);
    final canSubmit = ref.watch(completeProfileSubmitValidationProvider) ==
        CompleteProfileSubmitValidation.ok;

    return Scaffold(
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
                child: tagListAsync.when(
                  data: (res) => _buildTagList(res, selectedTagIds, ref),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (_, __) => Center(
                        child: AsyncLoadErrorBody(
                          onRetry: () => ref.invalidate(tagListProvider),
                        ),
                      ),
                ),
              ),
              _buildBottomBar(context, canSubmit, ref),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTagList(
      GetTagsResponse res, Set<String> selectedTagIds, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: res.groups.map((g) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  g.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryDark,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: g.items.map((tag) {
                    final id = effectiveTagId(tag);
                    final selected = selectedTagIds.contains(id);
                    return SelectableTagChip(
                      label: tag.name,
                      selected: selected,
                      duration: const Duration(milliseconds: 320),
                      onTap: () =>
                          ref.read(selectedTagIdsProvider.notifier).toggle(id),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, bool canSubmit, WidgetRef ref) {
    return FullWidthBottomActionBar(
      gradientColors: [
        Colors.white.withOpacity(0.5),
        Colors.white,
      ],
      onPressed: canSubmit ? () => _handleSubmit(context, ref) : null,
      label: '进入搭搭星球',
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
              onPressed: () => GlobalRouter.instance.pop(),
              icon: const Icon(Icons.arrow_back, color: AppColors.primaryDark),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.borderPurple.withOpacity(0.5),
              ),
            ),
          ),
          const Text(
            '请选择个人标签',
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
}
