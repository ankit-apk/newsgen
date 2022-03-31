import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsgen/news/screens/home.dart';
import 'package:sizer/sizer.dart';

import 'news/repo/news_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'NewsGen',
        home: RepositoryProvider(
          create: (context) => NewsRepository(),
          child: const NewsHome(),
        ),
      );
    });
  }
}
