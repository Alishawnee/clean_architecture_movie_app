import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase.dart/base_usecase.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationUsecase
    extends BaseUsecase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetRecommendationUsecase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
          RecommendationParameters parameters) async =>
      await baseMovieRepository.getRecommendation(parameters);
}

class RecommendationParameters extends Equatable {
  final int id;
  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];
}
