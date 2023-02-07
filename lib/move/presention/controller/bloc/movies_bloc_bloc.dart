import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:moveapp/core/utils/enums.dart';
import 'package:moveapp/move/domain/entity/move_entity.dart';
import 'package:moveapp/move/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:moveapp/move/domain/usecase/get_populer_use_case.dart';
import 'package:moveapp/move/domain/usecase/get_toprating_movies_usecase.dart';

part 'movies_bloc_event.dart';
part 'movies_bloc_state.dart';

class MoviesBloc extends Bloc<MoviesBlocEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUsecase getPopularMoviesUseCase;
  final GetTopRatingMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super( const MoviesState( )) {

    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);


    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }


  

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();
    
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
         nowPlayingMovies: r,
         nowPlayingState: RequestState.loaded,
        )
      ),
    );


  
  }


  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase.execute();
    // print(result);
    
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        )
        
      ),
      (r) =>
      
       emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded
        )
        
        
      ),
    );


  
  }

  

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{

      final result  = await getTopRatedMoviesUseCase.execute();

       result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        )
        
      ),
      (r) =>
      
       emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded
        )
        
        
      ),
    );
  }
}