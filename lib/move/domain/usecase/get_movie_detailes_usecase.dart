import 'package:dartz/dartz.dart';
import 'package:moveapp/core/error/failure.dart';
import 'package:moveapp/move/domain/entity/move_entity.dart';
import 'package:moveapp/move/domain/reposetry/base_movies_repositiry.dart';

class GetMoviesDetaailesUseCase 
{
final  BaseMoviesRepositiry baseMoviesRepositiry;

  GetMoviesDetaailesUseCase(this.baseMoviesRepositiry);

Future <Either<Failure,List<Movies>>>  execute()async{
  return await  baseMoviesRepositiry.getPopularMovies(); 
  }


}