import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/posts.dart';
import '../data/posts_repository.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepository _postsRepository;
  PostsCubit(this._postsRepository) : super(PostsInitial());
  RedditPosts posts = RedditPosts([]);
  Future<void> getPosts() async {
    try {
      emit(PostsLoading());
      posts.compare(await _postsRepository.fetchPosts());
      emit(PostsLoaded(posts: posts));
    } catch (error) {
      emit(PostsError('Ошибка $error'));
    }
  }
}
