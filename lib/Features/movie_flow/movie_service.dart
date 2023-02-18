import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter16_movierec/Features/movie_flow/genre/genre.dart';
import 'package:flutter16_movierec/Features/movie_flow/movie_repository.dart';
import 'package:flutter16_movierec/Features/movie_flow/result/movie.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter16_movierec/Core/enviornment_variables.dart';
import 'package:flutter16_movierec/Features/movie_flow/genre/genre_entity.dart';
import 'package:flutter16_movierec/Features/movie_flow/result/movie_entity.dart';
import 'package:flutter16_movierec/main.dart';

final movieServiceProvider = Provider<MovieService>((ref){
  final movieRepository = ref.watch(movieRepositoryProvider);
  return TMDBMovieService(movieRepository);
});

abstract class MovieService{
  Future<List<Genre>> getGenres();
  Future<Movie> getRecommendedMovies(int rating, int yearsBack, List<Genre> genres, [DateTime? yearsBackFromDate]);
}

class TMDBMovieService implements MovieService{
  TMDBMovieService(this._movieRepository);
  final MovieRepository _movieRepository;

  @override
  Future<List<Genre>> getGenres() async{
    final genreEntities = await _movieRepository.getMovieGenres();
    final genres = genreEntities.map((e) => Genre.fromEntity(e)).toList();
    return genres;
  }

  @override
  Future<Movie> getRecommendedMovies(int rating, int yearsBack, List<Genre> genres, [DateTime? yearsBackFromDate]) async{
    final date = yearsBackFromDate ?? DateTime.now();
    final year = date.year - yearsBack;
    final genreIds = genres.map((e) => e.id).toList().join(',');

    final movieEntities = await _movieRepository.getRecommendedMovies(rating.toDouble(), '$year-01-01', genreIds);
    final movies = movieEntities.map((e) => Movie.fromEntity(e, genres)).toList();

    final rnd = Random();
    final randomMovie = movies[rnd.nextInt(movies.length)];
    return randomMovie;
  }

}