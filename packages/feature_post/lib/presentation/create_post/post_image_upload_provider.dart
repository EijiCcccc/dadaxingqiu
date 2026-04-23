import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/post_repository_provider.dart';

@immutable
class PostImageUploadState {
  const PostImageUploadState({
    this.isLoading = false,
    this.error,
    this.publicUrl,
  });

  final bool isLoading;
  final Object? error;
  final String? publicUrl;
}

final postImageUploadProvider =
    NotifierProvider<PostImageUploadNotifier, PostImageUploadState>(
  PostImageUploadNotifier.new,
);

class PostImageUploadNotifier extends Notifier<PostImageUploadState> {
  @override
  PostImageUploadState build() => const PostImageUploadState();

  Future<String?> uploadImage({
    required List<int> imageBytes,
    required String contentType,
    required String fileName,
  }) async {
    state = const PostImageUploadState(isLoading: true);
    try {
      final repository = ref.read(postRepositoryProvider);
      final response = await repository.getImageUploadToken(
        fileName: fileName,
        contentType: contentType,
      );
      await repository.uploadImageToUrl(
        uploadUrl: response.uploadUrl,
        imageBytes: imageBytes,
        headers: {
          'Content-Type': contentType,
        },
      );
      state = PostImageUploadState(publicUrl: response.publicUrl);
      return response.publicUrl;
    } catch (e) {
      state = PostImageUploadState(error: e);
      return null;
    }
  }

  void reset() {
    state = const PostImageUploadState();
  }
}
