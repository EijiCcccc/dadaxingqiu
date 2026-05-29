import 'package:network/network.dart';

class PostDetailState {
  const PostDetailState({
    required this.post,
    required this.comments,
    required this.likes,
    this.isSendingComment = false,
    this.isDeletingPost = false,
    this.isUpdatingVisibility = false,
  });

  final PostItem post;
  final List<PostCommentItem> comments;
  final List<PostAuthorRelation> likes;
  final bool isSendingComment;
  final bool isDeletingPost;
  final bool isUpdatingVisibility;

  PostDetailState copyWith({
    PostItem? post,
    List<PostCommentItem>? comments,
    List<PostAuthorRelation>? likes,
    bool? isSendingComment,
    bool? isDeletingPost,
    bool? isUpdatingVisibility,
  }) {
    return PostDetailState(
      post: post ?? this.post,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
      isSendingComment: isSendingComment ?? this.isSendingComment,
      isDeletingPost: isDeletingPost ?? this.isDeletingPost,
      isUpdatingVisibility: isUpdatingVisibility ?? this.isUpdatingVisibility,
    );
  }
}
