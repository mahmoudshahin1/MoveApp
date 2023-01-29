import 'package:dartz/dartz.dart';
import 'package:moveapp/core/error/failure.dart';
import 'package:moveapp/move/data/model/movie_model.dart';
import 'package:moveapp/move/domain/entity/move_entity.dart';

abstract class BaseMoviesRepositiry
{
Future <Either<Failure,List<Movies>>>  getNowPlayingMovies();
Future <Either<Failure,List<Movies>>>  getPopularMovies();
Future <Either<Failure,List<Movies>>>  getTopratingMovies();
}