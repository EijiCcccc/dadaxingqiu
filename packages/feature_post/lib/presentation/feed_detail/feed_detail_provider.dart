import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';
import 'package:protobuf/protobuf.dart';

import '../../providers/feed_list_provider.dart';
import '../../providers/post_repository_provider.dart';
import 'feed_detail_state.dart';

final feedDetailProvider = AsyncNotifierProvider.autoDispose
    .family<FeedDetailNotifier, PostDetailState, String>(
  () => FeedDetailNotifier(),
);

class FeedDetailNotifier
    extends AutoDisposeFamilyAsyncNotifier<PostDetailState, String> {
  @override
  FutureOr<PostDetailState> build(String postId) async {
    return _load(postId);
  }

  Future<PostDetailState> _load(String postId) async {
    final repository = ref.read(postRepositoryProvider);
    final detailFuture = repository.getPostDetail(postId);
    final commentsFuture = repository.getPostComments(postId);
    final likesFuture = repository.getPostLikes(postId);
    final results = await Future.wait([
      detailFuture,
      commentsFuture,
      likesFuture,
    ]);
    final detail = results[0] as GetPostDetailResponse;
    final comments = results[1] as GetPostCommentsResponse;
    final likes = results[2] as GetPostLikesResponse;
    return PostDetailState(
      post: detail.post,
      comments: comments.items.toList(),
      likes: likes.items.toList(),
    );
  }

  Future<void> refresh() async {
    state = AsyncData(await _load(arg));
  }

  Future<void> toggleLike() async {
    final current = state.valueOrNull;
    if (current == null) return;
    final optimistic = _copyPost(
      current.post,
      isLikedByMe: !current.post.isLikedByMe,
      likeCount: current.post.isLikedByMe
          ? current.post.likeCount - 1
          : current.post.likeCount + 1,
    );
    state = AsyncData(current.copyWith(post: optimistic));
    try {
      final repository = ref.read(postRepositoryProvider);
      if (current.post.isLikedByMe) {
        final response = await repository.unlikePost(arg);
        state = AsyncData(
          current.copyWith(
            post: _copyPost(
              optimistic,
              isLikedByMe: response.isLiked,
              likeCount: response.likeCount,
            ),
          ),
        );
      } else {
        final response = await repository.likePost(arg);
        state = AsyncData(
          current.copyWith(
            post: _copyPost(
              optimistic,
              isLikedByMe: response.isLiked,
              likeCount: response.likeCount,
            ),
          ),
        );
      }
      _invalidateFeeds();
    } catch (_) {
      state = AsyncData(current);
    }
  }

  Future<void> submitComment({
    required String content,
    String? replyToCommentId,
  }) async {
    final current = state.valueOrNull;
    if (current == null || content.trim().isEmpty || current.isSendingComment) {
      return;
    }
    state = AsyncData(current.copyWith(isSendingComment: true));
    try {
      final repository = ref.read(postRepositoryProvider);
      final response = replyToCommentId == null
          ? await repository.createComment(postId: arg, content: content.trim())
          : await repository.replyComment(
              postId: arg,
              commentId: replyToCommentId,
              content: content.trim(),
            );
      final comment = replyToCommentId == null
          ? (response as CreatePostCommentResponse).comment
          : (response as ReplyPostCommentResponse).comment;
      state = AsyncData(
        current.copyWith(
          isSendingComment: false,
          post: _copyPost(
            current.post,
            commentCount: current.post.commentCount + 1,
          ),
          comments: [comment, ...current.comments],
        ),
      );
      _invalidateFeeds();
    } catch (_) {
      state = AsyncData(current.copyWith(isSendingComment: false));
    }
  }

  Future<void> deleteComment(String commentId) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final filtered = current.comments
        .where((comment) => comment.commentId.toString() != commentId)
        .toList();
    state = AsyncData(
      current.copyWith(
        comments: filtered,
        post: _copyPost(
          current.post,
          commentCount: current.post.commentCount > Int64.ZERO
              ? current.post.commentCount - 1
              : Int64.ZERO,
        ),
      ),
    );
    try {
      await ref
          .read(postRepositoryProvider)
          .deleteComment(postId: arg, commentId: commentId);
      _invalidateFeeds();
    } catch (_) {
      state = AsyncData(current);
    }
  }

  Future<bool> deletePost() async {
    final current = state.valueOrNull;
    if (current == null || current.isDeletingPost) return false;
    state = AsyncData(current.copyWith(isDeletingPost: true));
    try {
      await ref.read(postRepositoryProvider).deletePost(arg);
      _invalidateFeeds();
      return true;
    } catch (_) {
      state = AsyncData(current.copyWith(isDeletingPost: false));
      return false;
    }
  }

  Future<void> updateVisibility(PostVisibility visibility) async {
    final current = state.valueOrNull;
    if (current == null || current.isUpdatingVisibility) return;
    state = AsyncData(current.copyWith(isUpdatingVisibility: true));
    try {
      final response = await ref.read(postRepositoryProvider).updateVisibility(
            postId: arg,
            visibility: visibility,
          );
      state = AsyncData(
        current.copyWith(
          isUpdatingVisibility: false,
          post: response.post,
        ),
      );
      _invalidateFeeds();
    } catch (_) {
      state = AsyncData(current.copyWith(isUpdatingVisibility: false));
    }
  }

  Future<void> toggleFollowUser(String userId) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final targetRelation = _findUserRelation(current, userId);
    if (targetRelation == null) return;

    final optimisticRelation = targetRelation.deepCopy()
      ..isFollowing = !targetRelation.isFollowing
      ..isMutualFollow =
          !targetRelation.isFollowing && targetRelation.isFollowedBy;
    state =
        AsyncData(_replaceUserRelation(current, userId, optimisticRelation));

    try {
      final repository = ref.read(postRepositoryProvider);
      final relation = targetRelation.isFollowing
          ? (await repository.unfollowUser(userId)).relation
          : (await repository.followUser(userId)).relation;
      final synced = optimisticRelation.deepCopy()
        ..isFollowing = relation.isFollowing
        ..isFollowedBy = relation.isFollowedByTargetUser
        ..isMutualFollow = relation.isMutualFollow;
      state = AsyncData(_replaceUserRelation(current, userId, synced));
      _invalidateFeeds();
    } catch (_) {
      state = AsyncData(current);
    }
  }

  PostAuthorRelation? _findUserRelation(PostDetailState state, String userId) {
    if (state.post.author.userId.toString() == userId) {
      return state.post.author;
    }
    for (final like in state.likes) {
      if (like.userId.toString() == userId) return like;
    }
    for (final comment in state.comments) {
      if (comment.author.userId.toString() == userId) return comment.author;
    }
    return null;
  }

  PostDetailState _replaceUserRelation(
    PostDetailState current,
    String userId,
    PostAuthorRelation relation,
  ) {
    final post = current.post.author.userId.toString() == userId
        ? _copyPost(current.post, author: relation)
        : current.post;
    final likes = current.likes
        .map(
          (item) => item.userId.toString() == userId
              ? relation.deepCopy()
              : item.deepCopy(),
        )
        .toList();
    final comments = current.comments
        .map(
          (item) => item.author.userId.toString() == userId
              ? (item.deepCopy()..author = relation.deepCopy())
              : item.deepCopy(),
        )
        .toList();
    return current.copyWith(post: post, likes: likes, comments: comments);
  }

  PostItem _copyPost(
    PostItem post, {
    PostAuthorRelation? author,
    Int64? likeCount,
    Int64? commentCount,
    bool? isLikedByMe,
  }) {
    return post.deepCopy()
      ..author = author ?? post.author.deepCopy()
      ..likeCount = likeCount ?? post.likeCount
      ..commentCount = commentCount ?? post.commentCount
      ..isLikedByMe = isLikedByMe ?? post.isLikedByMe;
  }

  void _invalidateFeeds() {
    ref.invalidate(feedListProvider(FeedSource.friends));
    ref.invalidate(feedListProvider(FeedSource.square));
  }
}
