import 'dart:convert';

import 'post.dart';

class RedditPosts {
  List<RedditPost> posts = [];

  RedditPosts(this.posts);

  compare(List<RedditPost> compareposts) async {
    for (var element in posts) {
      for (int i = 0; i < compareposts.length; i++) {
        if (element.text == compareposts[i].text &&
            element.title == compareposts[i].title &&
            element.thumbnail == compareposts[i].thumbnail) {
          compareposts.removeAt(i);
          break;
        }
      }
    }
    posts = compareposts + posts;
  }

  static List<RedditPost> parseJson(String json) {
    List<RedditPost> posts = [];
    var parsedJson = jsonDecode(json);
    parsedJson = parsedJson['data']['children'];
    parsedJson.forEach((element) {
      RedditPost temppost = RedditPost(
          title: element['data']['title'],
          text: element['data']['selftext'],
          ups: element['data']['ups'].toString());
      element['data']['thumbnail'].toString() != 'self' &&
              element['data']['thumbnail'].toString() != 'default'
          ? temppost.thumbnail = element['data']['thumbnail']
          : null;
      posts.add(temppost);
    });
    return posts;
  }
}
