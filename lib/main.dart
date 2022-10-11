import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdev_view/cubit/posts_cubit.dart';
import 'package:flutterdev_view/data/posts_repository.dart';
import 'package:flutterdev_view/screens/main_screen.dart';

void main() {
  runApp(const Flutterdev());
}

class Flutterdev extends StatelessWidget {
  const Flutterdev({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список постов FlutterDev',
      home: BlocProvider(
        create: (context) => PostsCubit(GetPostsRepository()),
        child: const MainScreen(),
      ),
    );
  }
}
