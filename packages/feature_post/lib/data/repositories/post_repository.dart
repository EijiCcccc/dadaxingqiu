import 'package:dio/dio.dart';
import 'package:fixnum/fixnum.dart';

import 'package:core/core.dart';
import 'package:network/network.dart';

class PostRepository {
  PostRepository(this._client);

  final DioClient _client;

  Future<GetFriendPostsResponse> getFriendPosts({
    int page = 1,
    int pageSize = 20,
  }) {
    return _client.getPb<GetFriendPostsResponse>(
      ApiPath.friendPosts,
      message: GetFriendPostsResponse.new,
      queryParameters: {
        'page': page,
        'page_size': pageSize,
      },
    );
  }

  Future<GetSquarePostsResponse> getSquarePosts({
    int page = 1,
    int pageSize = 20,
  }) {
    return _client.getPb<GetSquarePostsResponse>(
      ApiPath.squarePosts,
      message: GetSquarePostsResponse.new,
      queryParameters: {
        'page': page,
        'page_size': pageSize,
      },
    );
  }

  Future<GetPostDetailResponse> getPostDetail(String postId) {
    return _client.getPb<GetPostDetailResponse>(
      ApiPath.postDetail(postId),
      message: GetPostDetailResponse.new,
    );
  }

  Future<GetPostCommentsResponse> getPostComments(
    String postId, {
    int page = 1,
    int pageSize = 50,
  }) {
    return _client.getPb<GetPostCommentsResponse>(
      ApiPath.postComments(postId),
      message: GetPostCommentsResponse.new,
      queryParameters: {
        'page': page,
        'page_size': pageSize,
      },
    );
  }

  Future<GetPostLikesResponse> getPostLikes(
    String postId, {
    int page = 1,
    int pageSize = 50,
  }) {
    return _client.getPb<GetPostLikesResponse>(
      ApiPath.postLikes(postId),
      message: GetPostLikesResponse.new,
      queryParameters: {
        'page': page,
        'page_size': pageSize,
      },
    );
  }

  Future<LikePostResponse> likePost(String postId) {
    return _client.postPb<LikePostResponse, LikePostRequest>(
      ApiPath.likePost,
      request: LikePostRequest()..postId = _toInt64(postId),
      message: LikePostResponse.new,
    );
  }

  Future<UnlikePostResponse> unlikePost(String postId) {
    return _client.postPb<UnlikePostResponse, UnlikePostRequest>(
      ApiPath.unlikePost,
      request: UnlikePostRequest()..postId = _toInt64(postId),
      message: UnlikePostResponse.new,
    );
  }

  Future<CreatePostCommentResponse> createComment({
    required String postId,
    required String content,
  }) {
    return _client.postPb<CreatePostCommentResponse, CreatePostCommentRequest>(
      ApiPath.postCommentsCreate,
      request: CreatePostCommentRequest()
        ..postId = _toInt64(postId)
        ..content = content,
      message: CreatePostCommentResponse.new,
    );
  }

  Future<ReplyPostCommentResponse> replyComment({
    required String postId,
    required String commentId,
    required String content,
  }) {
    return _client.postPb<ReplyPostCommentResponse, ReplyPostCommentRequest>(
      ApiPath.postCommentsReply,
      request: ReplyPostCommentRequest()
        ..postId = _toInt64(postId)
        ..commentId = _toInt64(commentId)
        ..content = content,
      message: ReplyPostCommentResponse.new,
    );
  }

  Future<DeletePostCommentResponse> deleteComment({
    required String postId,
    required String commentId,
  }) {
    return _client.postPb<DeletePostCommentResponse, DeletePostCommentRequest>(
      ApiPath.postCommentsDelete,
      request: DeletePostCommentRequest()
        ..postId = _toInt64(postId)
        ..commentId = _toInt64(commentId),
      message: DeletePostCommentResponse.new,
    );
  }

  Future<DeletePostResponse> deletePost(String postId) {
    return _client.postPb<DeletePostResponse, DeletePostRequest>(
      ApiPath.postDelete,
      request: DeletePostRequest()..postId = _toInt64(postId),
      message: DeletePostResponse.new,
    );
  }

  Future<UpdatePostVisibilityResponse> updateVisibility({
    required String postId,
    required PostVisibility visibility,
  }) {
    return _client.postPb<UpdatePostVisibilityResponse, UpdatePostVisibilityRequest>(
      ApiPath.postVisibility,
      request: UpdatePostVisibilityRequest()
        ..postId = _toInt64(postId)
        ..visibility = visibility,
      message: UpdatePostVisibilityResponse.new,
    );
  }

  Future<GetPostNotificationsResponse> getNotifications({
    int page = 1,
    int pageSize = 20,
  }) {
    return _client.getPb<GetPostNotificationsResponse>(
      ApiPath.postNotifications,
      message: GetPostNotificationsResponse.new,
      queryParameters: {
        'page': page,
        'page_size': pageSize,
      },
    );
  }

  Future<GetPostUnreadCountResponse> getUnreadCount() {
    return _client.getPb<GetPostUnreadCountResponse>(
      ApiPath.postNotificationsUnread,
      message: GetPostUnreadCountResponse.new,
    );
  }

  Future<MarkPostNotificationsReadResponse> markNotificationsRead() {
    return _client.postPb<MarkPostNotificationsReadResponse, MarkPostNotificationsReadRequest>(
      ApiPath.postNotificationsRead,
      request: MarkPostNotificationsReadRequest(),
      message: MarkPostNotificationsReadResponse.new,
    );
  }

  Future<FollowUserResponse> followUser(String userId) {
    return _client.postPb<FollowUserResponse, FollowUserRequest>(
      ApiPath.follows,
      request: FollowUserRequest()..targetUserId = userId,
      message: FollowUserResponse.new,
    );
  }

  Future<UnfollowUserResponse> unfollowUser(String userId) {
    return _client.postPb<UnfollowUserResponse, UnfollowUserRequest>(
      ApiPath.unfollowUser,
      request: UnfollowUserRequest()..targetUserId = userId,
      message: UnfollowUserResponse.new,
    );
  }

  Future<CreatePostImageUploadResponse> getImageUploadToken({
    required String fileName,
    required String contentType,
  }) {
    return _client.postPb<CreatePostImageUploadResponse, CreatePostImageUploadRequest>(
      ApiPath.postImageUploadToken,
      request: CreatePostImageUploadRequest()
        ..fileName = fileName
        ..contentType = contentType,
      message: CreatePostImageUploadResponse.new,
    );
  }

  Future<void> uploadImageToUrl({
    required String uploadUrl,
    required List<int> imageBytes,
    Map<String, String>? headers,
  }) async {
    await _client.dio.put<void>(
      uploadUrl,
      data: imageBytes,
      options: Options(
        headers: headers,
        contentType: headers?['Content-Type'],
      ),
    );
  }

  Future<CreatePostResponse> createPost({
    required String content,
    required List<String> imageUrls,
    required PostVisibility visibility,
  }) {
    return _client.postPb<CreatePostResponse, CreatePostRequest>(
      ApiPath.posts,
      request: CreatePostRequest()
        ..content = content
        ..imageUrls.addAll(imageUrls)
        ..visibility = visibility,
      message: CreatePostResponse.new,
    );
  }

  Int64 _toInt64(String value) => Int64.parseInt(value);
}
