part of 'posts_cubit.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final RedditPosts posts;
  PostsLoaded({required this.posts});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostsLoaded && other.posts == posts;
  }

  @override
  int get hashCode => posts.hashCode;
}

class PostsError extends PostsState {
  final String message;
  PostsError(this.message);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PostsError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
