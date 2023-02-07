import 'package:dio/dio.dart';
import 'package:moveapp/core/error/exceptions.dart';
import 'package:moveapp/core/network/api_constance.dart';
import 'package:moveapp/core/network/error_message_model.dart';
import 'package:moveapp/move/data/model/movie_model.dart';

abstract class BaseMovieReomteDataSource{

  Future<List<MovieModel>> getNowPlayingMovies();
  
  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();





}

class MovieReomteDataSource extends BaseMovieReomteDataSource
{
  @override
  Future<List<MovieModel>> getNowPlayingMovies()async {
    
  final response= await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] 
      as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJason(response.data));
    }


  }

   @override
     Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}