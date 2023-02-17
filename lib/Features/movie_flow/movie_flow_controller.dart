import 'package:flutter/material.dart';
import 'package:flutter16_movierec/Features/movie_flow/genre/genre.dart';
import 'package:flutter16_movierec/Features/movie_flow/movie_flow_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieFlowControllerProvider = StateNotifierProvider.autoDispose<MovieFlowController, MovieFlowState>((ref){
  return MovieFlowController(
    MovieFlowState(
      pageController: PageController(),
    ),
  );
});

class MovieFlowController extends StateNotifier<MovieFlowState> {
  MovieFlowController(MovieFlowState state) : super(state);

  void toggleSelected(Genre genre){
    state = state.copyWith(
      genres: [
        for(final oldGenre in state.genres)
          if(oldGenre == genre) oldGenre.toggleSelected() else oldGenre
      ],
    );
  }

  void updateRating(int updateRating){
    state = state.copyWith(rating: updateRating);
  }

  void updateYearsBack(int updateYearsBack){
    state = state.copyWith(yearsBack: updateYearsBack);
  }

  void nextPage(){
    if(state.pageController.page! >= 1){
      if(!state.genres.any((element) => element.isSelected == true)){
        return;
      }
    }
    state.pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeOutCubic);
  }void previousPage(){
    state.pageController.previousPage(duration: const Duration(milliseconds: 600), curve: Curves.easeOutCubic);
  }

  @override
  void dispose(){
    state.pageController.dispose();
    super.dispose();
  }

}