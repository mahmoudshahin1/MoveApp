import 'package:dio/dio.dart';
import 'package:moveapp/core/error/exceptions.dart';
import 'package:moveapp/core/network/api_constance.dart';
import 'package:moveapp/core/network/error_message_model.dart';
import 'package:moveapp/move/data/model/movie_details_model.dart';
import 'package:moveapp/move/data/model/movie_model.dart';
import 'package:moveapp/move/domain/usecase/get_movie_detais_use_case.dart';

abstract class BaseMovieReomteDataSource{

  Future<List<MovieModel>> getNowPlayingMovies();
  
  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails( MovieDetailsParameters parameters);





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
  
  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}