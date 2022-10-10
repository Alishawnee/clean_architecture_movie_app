import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase.dart/base_usecase.dart';

class GetPopularMoviesUsecase extends BaseUsecase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetPopularMoviesUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async =>
      await baseMovieRepository.getPopularMovies();
}
