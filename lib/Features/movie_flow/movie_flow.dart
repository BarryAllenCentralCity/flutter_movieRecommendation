
import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Features/movie_flow/genre/genre_screen.dart';
import 'package:flutter16_movierec/Features/movie_flow/landing/landing_screen.dart';
import 'package:flutter16_movierec/Features/movie_flow/rating/rating_screen.dart';
import 'package:flutter16_movierec/Features/movie_flow/years_back/years_back_screen.dart';

class MovieFLow extends StatefulWidget {
  const MovieFLow({Key? key}) : super(key: key);

  @override
  State<MovieFLow> createState() => _MovieFLowState();
}

class _MovieFLowState extends State<MovieFLow> {
  final pageController = PageController();

  void nextPage(){
    pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeOutCubic);
  }
  void previousPage(){
    pageController.previousPage(duration: const Duration(milliseconds: 600), curve: Curves.easeOutCubic);
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        LandingScreen(nextPage: nextPage, previousPage: previousPage,),
        GenreScreen(nextPage: nextPage, previousPage: previousPage),
        RatingScreen(nextPage: nextPage, previousPage: previousPage),
        YearsBackScreen(nextPage: nextPage, previousPage: previousPage),
      ],
    );
  }
}
