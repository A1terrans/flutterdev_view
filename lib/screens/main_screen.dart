import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdev_view/cubit/posts_cubit.dart';
import 'package:flutterdev_view/data/model/posts.dart';
import 'package:flutterdev_view/screens/detail_screen.dart';
import 'package:flutterdev_view/widgets/post_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Center(child: Text('Список постов FlutterDev'))),
      body: BlocConsumer<PostsCubit, PostsState>(builder: ((context, state) {
        if (state is PostsInitial) {
          getPosts(context);
        } else if (state is PostsLoading) {
          return postsLoading();
        } else if (state is PostsLoaded) {
          return RefreshIndicator(
              child: listPostsWithData(state.posts),
              onRefresh: () async {
                getPosts(context);
                return await Future<void>.delayed(const Duration(seconds: 1));
              });
        } else {
          getPosts(context);
        }
        return Container();
      }), listener: (context, state) {
        if (state is PostsError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      }),
    );
  }

  Widget postsLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  ListView listPostsWithData(RedditPosts listposts) {
    return ListView.builder(
        itemCount: listposts.posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: listposts.posts[index]);
        });
  }

  void getPosts(BuildContext context) {
    final postsCubit = BlocProvider.of<PostsCubit>(context);
    postsCubit.getPosts();
  }
}
