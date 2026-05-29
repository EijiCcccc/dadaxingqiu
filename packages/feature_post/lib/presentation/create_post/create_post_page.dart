import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:shared/shared.dart';

import 'create_post_provider.dart';

class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({super.key});

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  static const _maxLength = 500;
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _syncControllerText(ref.read(createPostProvider).content);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createPostProvider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await _handleBack(state);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _dismissKeyboard,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GradientBackgroundWidget(
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  AppBarWidget(
                    title: '发布动态',
                    onBack: () => _handleBack(state),
                    actions: [
                      TextButton(
                        onPressed: state.canSubmit ? _handleSubmit : null,
                        child: const Text(
                          '发布',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                      children: [
                        TextField(
                          style: const TextStyle(color: Colors.black),
                          controller: _controller,
                          maxLines: 8,
                          minLines: 6,
                          maxLength: _maxLength,
                          onTapOutside: (_) => _dismissKeyboard(),
                          onChanged:
                              ref.read(createPostProvider.notifier).setContent,
                          decoration: const InputDecoration(
                            hintText: '分享今天的新鲜事吧~',
                            border: InputBorder.none,
                            counterText: '',
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${state.content.length}/$_maxLength',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _ImageGrid(
                          images: state.images,
                          isPicking: state.isPickingImages,
                          onAdd: _handlePickImages,
                          onRemove: (index) => ref
                              .read(createPostProvider.notifier)
                              .removeImageAt(index),
                        ),
                        const SizedBox(height: 12),
                        _VisibilityTile(
                          visibility: state.visibility,
                          onTap: () => _showVisibilitySheet(state.visibility),
                        ),
                        if (state.error != null) ...[
                          const SizedBox(height: 12),
                          Text(
                            state.error!,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 13,
                            ),
                          ),
                        ],
                        const SizedBox(height: 16),
                        Text(
                          '禁止发布色情、谩骂、引战、第三方平台等违规内容，多次发布违规内容将被禁言或封号。',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FullWidthBottomActionBar(
                    onPressed: state.canSubmit ? _handleSubmit : null,
                    label: '发布动态',
                    loading: state.isSubmitting,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _dismissKeyboard() {
    final focusScope = FocusScope.of(context);
    if (!focusScope.hasPrimaryFocus && focusScope.focusedChild != null) {
      focusScope.unfocus();
    }
  }

  void _syncControllerText(String content) {
    if (_controller.text == content) return;
    _controller.value = TextEditingValue(
      text: content,
      selection: TextSelection.collapsed(offset: content.length),
    );
  }

  Future<void> _handleSubmit() async {
    _dismissKeyboard();
    final result = await ref.read(createPostProvider.notifier).submit();
    if (!mounted || result == null) return;
    GlobalRouter.instance.pop();
  }

  Future<void> _handlePickImages() async {
    final notifier = ref.read(createPostProvider.notifier);
    final granted = await notifier.requestPermission();
    if (granted) {
      await notifier.pickImages();
      return;
    }

    if (!mounted) return;
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('需要相册权限'),
        content: const Text('开启相册权限后才可以选择动态图片。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await notifier.openSettings();
            },
            child: const Text('去设置'),
          ),
        ],
      ),
    );
  }

  Future<void> _showVisibilitySheet(PostVisibility current) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final option in const [
                (PostVisibility.PUBLIC, '所有人可见'),
                (PostVisibility.FRIENDS_ONLY, '仅好友可见'),
                (PostVisibility.SQUARE_ONLY, '仅广场可见'),
                (PostVisibility.SELF_ONLY, '仅自己可见'),
              ])
                ListTile(
                  title: Text(option.$2),
                  trailing:
                      current == option.$1 ? const Icon(Icons.check) : null,
                  onTap: () {
                    ref
                        .read(createPostProvider.notifier)
                        .setVisibility(option.$1);
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _handleBack(CreatePostState state) async {
    if (state.isSubmitting) return;

    _dismissKeyboard();
    final notifier = ref.read(createPostProvider.notifier);
    if (!state.hasContent) {
      notifier.clearDraft();
      GlobalRouter.instance.pop();
      return;
    }

    final shouldSaveDraft = await AppDialog.show(
      context,
      title: '保存当前动态？',
      content: '当前动态尚未发布，是否保存后退出？',
      confirmText: '确定',
      cancelText: '取消',
      barrierDismissible: false,
    );
    if (!mounted || shouldSaveDraft == null) return;

    if (shouldSaveDraft) {
      notifier.saveDraft();
    } else {
      notifier.clearDraft();
    }
    GlobalRouter.instance.pop();
  }
}

class _ImageGrid extends StatelessWidget {
  const _ImageGrid({
    required this.images,
    required this.isPicking,
    required this.onAdd,
    required this.onRemove,
  });

  final List<PostDraftImage> images;
  final bool isPicking;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      for (var i = 0; i < images.length; i++)
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(images[i].localPath),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            if (images[i].isUploading)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
            if (images[i].error != null)
              Positioned(
                left: 8,
                right: 8,
                bottom: 8,
                child: Text(
                  images[i].error!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ),
            Positioned(
              right: 4,
              top: 4,
              child: InkWell(
                onTap: () => onRemove(i),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(Icons.close, color: Colors.white, size: 16),
                ),
              ),
            ),
          ],
        ),
    ];

    if (images.length < 9) {
      children.add(
        InkWell(
          onTap: isPicking ? null : onAdd,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity( 0.7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderPurple),
            ),
            child: Center(
              child: isPicking
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.add_photo_alternate_outlined),
            ),
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      physics: const NeverScrollableScrollPhysics(),
      children: children
          .map(
            (child) => AspectRatio(
              aspectRatio: 1,
              child: child,
            ),
          )
          .toList(),
    );
  }
}

class _VisibilityTile extends StatelessWidget {
  const _VisibilityTile({
    required this.visibility,
    required this.onTap,
  });

  final PostVisibility visibility;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity( 0.7),
      borderRadius: BorderRadius.circular(16),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('谁可以看'),
        subtitle: Text(createPostVisibilityLabel(visibility)),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
