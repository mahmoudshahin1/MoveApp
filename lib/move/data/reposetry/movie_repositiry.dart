import 'package:moveapp/core/error/exceptions.dart';
import 'package:moveapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moveapp/move/data/datasource/movie_reomte_data_source.dart';
import 'package:moveapp/move/domain/entity/move_entity.dart';
import 'package:moveapp/move/domain/reposetry/base_movies_repositiry.dart';

class MovieRepositiry extends BaseMoviesRepositiry
{
  final BaseMovieReomteDataSource baseMovieReomteDataSource;

  MovieRepositiry(this.baseMovieReomteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async{
  final result  = await baseMovieReomteDataSource.getNowPlayingMovies();
  
  try{

    return Right(result);
  } on ServerException catch (failure)
  {
    return left(ServerFailure(failure.errorMessageModel.statusMessage));
  }

  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies()async {
    final result  = await baseMovieReomteDataSource.getPopularMovies();
  
  try{

    return Right(result);
  } on ServerException catch (failure)
  {
    return left(ServerFailure(failure.errorMessageModel.statusMessage));
  }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopratingMovies()async {
   final result  = await baseMovieReomteDataSource.getTopRatedMovies();
  
  try{

    return Right(result);
  } on ServerException catch (failure)
  {
    return left(ServerFailure(failure.errorMessageModel.statusMessage));
  }
  }
  
}