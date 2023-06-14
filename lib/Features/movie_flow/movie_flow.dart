import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Features/movie_flow/genre/genre_screen.dart';
import 'package:flutter16_movierec/Features/movie_flow/landing/landing_screen.dart';
import 'package:flutter16_movierec/Features/movie_flow/movie_flow_controller.dart';
import 'package:flutter16_movierec/Features/movie_flow/rating/rating_screen.dart';
import 'package:flutter16_movierec/Features/movie_flow/result/result_screen.dart';
import 'package:flutter16_movierec/Features/movie_flow/years_back/years_back_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieFLow extends ConsumerWidget {
  const MovieFLow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      controller: ref.watch(movieFlowControllerProvider).pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        LandingScreen(),
        GenreScreen(),
        RatingScreen(),
        YearsBackScreen(),
      ],
    );
  }
}
