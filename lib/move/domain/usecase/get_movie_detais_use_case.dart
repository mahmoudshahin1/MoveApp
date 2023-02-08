import 'package:equatable/equatable.dart';
import 'package:moveapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:moveapp/core/usecase/base_use_case.dart';
import 'package:moveapp/move/domain/entity/move_details_entity.dart';
import 'package:moveapp/move/domain/reposetry/base_movies_repositiry.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetailsEntity, MovieDetailsParameters> {
  final BaseMoviesRepositiry baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}