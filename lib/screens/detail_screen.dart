import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../data/model/post.dart';

class DetailScreen extends StatelessWidget {
  RedditPost post;
  DetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(post.title))),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(children: [
          const SizedBox(height: 10),
          Text(post.title, textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text('Плюсов: ${post.ups}', textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text(_parseHtmlString(post.text)),
        ]),
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
