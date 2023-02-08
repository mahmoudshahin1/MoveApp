import 'package:moveapp/move/domain/entity/move_details_entity.dart';

class MovieDetailsModel  extends MovieDetailsEntity{
  const MovieDetailsModel({
    required super.backdropPath, 
    required super.genres, 
    required super.id, 
    required super.overview, 
    required super.releaseDate, 
    required super.runtime, 
    required super.title, 
    required super.voteAverage});

    factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json["backdrop_path"],
        genres: List<GenresModel>.from(
            json["genres"].map((x) => GenresModel.fromJson(x))),
        id: json["id"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        runtime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );
}

class GenresModel extends Genres {
  const GenresModel({
    required super.name,
    required super.id,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json["id"],
        name: json["name"],
      );
}
