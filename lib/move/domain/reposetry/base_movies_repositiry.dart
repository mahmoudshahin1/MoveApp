import 'package:dartz/dartz.dart';
import 'package:moveapp/core/error/failure.dart';
import 'package:moveapp/move/domain/entity/move_details_entity.dart';
import 'package:moveapp/move/domain/entity/move_entity.dart';
import 'package:moveapp/move/domain/usecase/get_movie_detais_use_case.dart';

abstract class BaseMoviesRepositiry
{
Future <Either<Failure,List<Movies>>>  getNowPlayingMovies();
Future <Either<Failure,List<Movies>>>  getPopularMovies();
Future <Either<Failure,List<Movies>>>  getTopratingMovies();
Future <Either<Failure,MovieDetailsEntity>>  getMovieDetails(MovieDetailsParameters parameters);
}