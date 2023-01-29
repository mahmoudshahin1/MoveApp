import 'package:dartz/dartz.dart';
import 'package:moveapp/core/error/failure.dart';
import 'package:moveapp/move/domain/entity/move_entity.dart';
import 'package:moveapp/move/domain/reposetry/base_movies_repositiry.dart';

class GetPopularMoviesUsecase 
{
final  BaseMoviesRepositiry baseMoviesRepositiry;

  GetPopularMoviesUsecase(this.baseMoviesRepositiry);

Future <Either<Failure,List<Movies>>>  execute()async{
  return await  baseMoviesRepositiry.getPopularMovies(); 
  }


}