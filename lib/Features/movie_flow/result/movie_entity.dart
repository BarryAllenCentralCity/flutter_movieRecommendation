import 'package:flutter/foundation.dart';

@immutable
class MovieEntity {
  final String title;
  final String overview;
  final num voteAverage;
  final List<dynamic> genreIds;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const MovieEntity({
    required this.title,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
        title: map['title'],
        overview: map['overview'],
        genreIds: map['genre_ids'],
        voteAverage: map['vote_average'],
        releaseDate: map['release_date']);
  }

  @override
  bool operator == (Object other){
    if(identical(this, other)) return true;

    return other is MovieEntity &&
      other.title == title &&
      other.overview == overview &&
      other.voteAverage == voteAverage &&
      listEquals(other.genreIds, genreIds) &&
      other.releaseDate == releaseDate &&
      other.backdropPath == backdropPath &&
      other.posterPath == posterPath;
  }

  @override
  int get hashCode{
    return title.hashCode ^
            overview.hashCode ^
            voteAverage.hashCode ^
            genreIds.hashCode ^
            releaseDate.hashCode ^
            backdropPath.hashCode ^
            posterPath.hashCode;
  }

  @override
  String toString() {
    return 'MovieEntity(title: $title, overview: $overview, voteAverage: $voteAverage, genreIds: $genreIds, releaseDate: $releaseDate, backdropPath: $backdropPath,posterPath: $posterPath)';
  }
}
