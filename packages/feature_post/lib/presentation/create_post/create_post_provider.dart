import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:network/network.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../providers/feed_list_provider.dart';
import '../../providers/post_repository_provider.dart';
import '../post_display.dart';
import 'post_image_upload_provider.dart';

class PostDraftImage {
  const PostDraftImage({
    required this.localPath,
    required this.fileName,
    this.publicUrl,
    this.isUploading = false,
    this.error,
  });

  final String localPath;
  final String fileName;
  final String? publicUrl;
  final bool isUploading;
  final String? error;

  PostDraftImage copyWith({
    String? localPath,
    String? fileName,
    String? publicUrl,
    bool? isUploading,
    String? error,
  }) {
    return PostDraftImage(
      localPath: localPath ?? this.localPath,
      fileName: fileName ?? this.fileName,
      publicUrl: publicUrl ?? this.publicUrl,
      isUploading: isUploading ?? this.isUploading,
      error: error,
    );
  }
}

class CreatePostState {
  const CreatePostState({
    this.content = '',
    this.images = const [],
    this.visibility = PostVisibility.PUBLIC,
    this.isPickingImages = false,
    this.isSubmitting = false,
    this.error,
  });

  final String content;
  final List<PostDraftImage> images;
  final PostVisibility visibility;
  final bool isPickingImages;
  final bool isSubmitting;
  final String? error;

  bool get hasUploadingImage => images.any((image) => image.isUploading);
  bool get canSubmit =>
      !isSubmitting &&
      !hasUploadingImage &&
      (content.trim().isNotEmpty || images.any((image) => image.publicUrl != null));

  CreatePostState copyWith({
    String? content,
    List<PostDraftImage>? images,
    PostVisibility? visibility,
    bool? isPickingImages,
    bool? isSubmitting,
    String? error,
  }) {
    return CreatePostState(
      content: content ?? this.content,
      images: images ?? this.images,
      visibility: visibility ?? this.visibility,
      isPickingImages: isPickingImages ?? this.isPickingImages,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
    );
  }
}

final createPostProvider =
    NotifierProvider.autoDispose<CreatePostNotifier, CreatePostState>(
  CreatePostNotifier.new,
);

class CreatePostNotifier extends AutoDisposeNotifier<CreatePostState> {
  static const _maxImages = 9;

  @override
  CreatePostState build() => const CreatePostState();

  void setContent(String value) {
    state = state.copyWith(content: value, error: null);
  }

  void setVisibility(PostVisibility visibility) {
    state = state.copyWith(visibility: visibility, error: null);
  }

  void removeImageAt(int index) {
    if (index < 0 || index >= state.images.length) return;
    final images = [...state.images]..removeAt(index);
    state = state.copyWith(images: images, error: null);
  }

  Future<bool> requestPermission() async {
    final permission = await _getPhotosPermission();
    final status = await permission.request();
    return status.isGranted || status.isLimited;
  }

  Future<PermissionStatus> checkPermission() async {
    final permission = await _getPhotosPermission();
    return permission.status;
  }

  Future<void> openSettings() async {
    await openAppSettings();
  }

  Future<void> pickImages() async {
    if (state.images.length >= _maxImages || state.isPickingImages) return;
    state = state.copyWith(isPickingImages: true, error: null);
    try {
      final files = await ImagePicker().pickMultiImage(
        imageQuality: 85,
        maxWidth: 2048,
        maxHeight: 2048,
      );
      if (files.isEmpty) {
        state = state.copyWith(isPickingImages: false);
        return;
      }

      final remaining = _maxImages - state.images.length;
      final pickedFiles = files.take(remaining).toList();
      var images = [...state.images];
      for (final file in pickedFiles) {
        final placeholder = PostDraftImage(
          localPath: file.path,
          fileName: file.name,
          isUploading: true,
        );
        images = [...images, placeholder];
        state = state.copyWith(images: images, isPickingImages: false);

        final uploaded = await _uploadFile(file);
        images = [
          for (final image in state.images)
            if (image.localPath == file.path)
              image.copyWith(
                isUploading: false,
                publicUrl: uploaded.$1,
                error: uploaded.$2,
              )
            else
              image,
        ];
        state = state.copyWith(images: images, isPickingImages: false);
      }
    } catch (e) {
      state = state.copyWith(
        isPickingImages: false,
        error: '选择图片失败: $e',
      );
    }
  }

  Future<PostItem?> submit() async {
    if (!state.canSubmit) return null;
    state = state.copyWith(isSubmitting: true, error: null);
    try {
      final imageUrls = state.images
          .map((image) => image.publicUrl)
          .whereType<String>()
          .toList();
      final response = await ref.read(postRepositoryProvider).createPost(
            content: state.content.trim(),
            imageUrls: imageUrls,
            visibility: state.visibility,
          );
      ref.invalidate(feedListProvider(FeedSource.friends));
      ref.invalidate(feedListProvider(FeedSource.square));
      state = const CreatePostState();
      return response.post;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: '发布动态失败: $e',
      );
      return null;
    }
  }

  Future<(String?, String?)> _uploadFile(XFile file) async {
    try {
      final bytes = await File(file.path).readAsBytes();
      final ext = file.path.split('.').last.toLowerCase();
      final contentType = switch (ext) {
        'jpg' || 'jpeg' => 'image/jpeg',
        'png' => 'image/png',
        'webp' => 'image/webp',
        'gif' => 'image/gif',
        _ => 'application/octet-stream',
      };
      final publicUrl =
          await ref.read(postImageUploadProvider.notifier).uploadImage(
                imageBytes: bytes,
                contentType: contentType,
                fileName: file.name,
              );
      if (publicUrl == null) {
        return (null, '上传失败');
      }
      return (publicUrl, null);
    } catch (e) {
      return (null, '上传失败: $e');
    }
  }

  Future<Permission> _getPhotosPermission() async {
    if (Platform.isIOS) return Permission.photos;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      return Permission.photos;
    }
    return Permission.storage;
  }
}

String createPostVisibilityLabel(PostVisibility visibility) {
  return postVisibilityLabel(visibility);
}
