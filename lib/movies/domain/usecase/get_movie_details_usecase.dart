import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase.dart/base_usecase.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';

import '../repository/base_movie_repository.dart';

class GetMovieDetailsUsecase
    extends BaseUsecase<MovieDetails, MovieDetailParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetails>> call(
          MovieDetailParameters parameters) async =>
      baseMovieRepository.getMovieDetails(parameters);
}

class MovieDetailParameters extends Equatable {
  final int movieId;
  const MovieDetailParameters({required this.movieId});
  @override
  List<Object?> get props => [id];
}
