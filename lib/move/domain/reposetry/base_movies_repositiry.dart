import 'package:moveapp/move/domain/entity/move_entity.dart';

abstract class BaseMoviesRepositiry
{
Future<List<Movies>>  getNowPlayingMovies();
Future<List<Movies>>  getPopularMovies();
Future<List<Movies>>  getTopratingMovies();
}