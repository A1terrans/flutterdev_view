import 'package:http/http.dart' as http;

import 'model/post.dart';
import 'model/posts.dart';

abstract class PostsRepository {
  Future<List<RedditPost>> fetchPosts();
}

class GetPostsRepository implements PostsRepository {
  @override
  Future<List<RedditPost>> fetchPosts() async {
    String url = 'https://www.reddit.com/r/flutterdev/new.json';
    final response = await http.get(Uri.parse(url));
    return RedditPosts.parseJson(response.body);
  }
}
