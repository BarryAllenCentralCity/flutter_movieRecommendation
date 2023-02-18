import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter16_movierec/Features/movie_flow/movie_flow.dart';
import 'package:flutter16_movierec/Theme/custom_theme.dart';

void main(){
  runApp(const ProviderScope(child: MyApp()));
}

final dioProvider = Provider<Dio>((ref){
  return Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
    )
  );
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Recommendation',
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      home: const MovieFLow(),
    );
  }
}

