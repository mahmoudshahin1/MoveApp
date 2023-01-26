import 'package:moveapp/move/domain/entity/move_entity.dart';
import 'package:moveapp/move/domain/reposetry/base_movies_repositiry.dart';

class GetMoviesDetaailesUseCase 
{
final  BaseMoviesRepositiry baseMoviesRepositiry;

  GetMoviesDetaailesUseCase(this.baseMoviesRepositiry);

Future<List<Movies>>  execute()async{
  return await  baseMoviesRepositiry.getPopularMovies(); 
  }


}