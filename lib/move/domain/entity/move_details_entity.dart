import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable
{
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;

  const MovieDetailsEntity({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
        backdropPath,
        genres,
        id,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
      ];
}


class Genres extends Equatable {
  final String name;
  final int id;

  const Genres({
    required this.name,
    required this.id,
  });

  @override
  List<Object> get props => [name, id];
}