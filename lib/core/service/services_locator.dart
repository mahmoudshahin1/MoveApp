import 'package:get_it/get_it.dart';
import 'package:moveapp/move/data/datasource/movie_reomte_data_source.dart';
import 'package:moveapp/move/data/reposetry/movie_repositiry.dart';
import 'package:moveapp/move/domain/reposetry/base_movies_repositiry.dart';
import 'package:moveapp/move/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:moveapp/move/domain/usecase/get_populer_use_case.dart';
import 'package:moveapp/move/domain/usecase/get_toprating_movies_usecase.dart';

import 'package:moveapp/move/presention/controller/bloc/movies_bloc_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    // sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatingMoviesUseCase(sl()));
    // sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    // sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));


    /// Repository
    sl.registerLazySingleton<BaseMoviesRepositiry>(
        () => MovieRepositiry(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieReomteDataSource>(
        () => MovieReomteDataSource());
  }
}
