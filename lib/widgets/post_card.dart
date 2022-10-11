import 'package:flutter/material.dart';
import 'package:flutterdev_view/screens/detail_screen.dart';

import '../data/model/post.dart';

class PostCard extends StatelessWidget {
  RedditPost post;
  PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (post.thumbnail != null) {
      return Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(post: post)),
              );
            },
            leading: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: width / 5),
                child: Image.network(post.thumbnail!)),
            title: Text(
              post.title,
              textAlign: TextAlign.center,
            )),
      );
    } else {
      return Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(post: post)),
              );
            },
            title: Text(
              post.title,
              textAlign: TextAlign.center,
            )),
      );
    }
  }
}
