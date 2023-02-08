import 'package:dartz/dartz.dart';
import 'package:moveapp/core/error/failure.dart';
import 'package:moveapp/core/usecase/base_use_case.dart';
import 'package:moveapp/move/domain/entity/move_entity.dart';
import 'package:moveapp/move/domain/reposetry/base_movies_repositiry.dart';

class GetTopRatingMoviesUseCase  extends BaseUseCase<List<Movies>>
{
final  BaseMoviesRepositiry baseMoviesRepositiry;

  GetTopRatingMoviesUseCase(this.baseMoviesRepositiry);
  
  @override
  Future<Either<Failure, List<Movies>>> call()async {
     return await  baseMoviesRepositiry.getTopratingMovies(); 
  }
  
  




}