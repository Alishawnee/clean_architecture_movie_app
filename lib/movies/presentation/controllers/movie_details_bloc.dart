import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/utills/enums.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/usecase/get_movie_details_usecase.dart';

import '../../domain/entities/movie_details.dart';
import '../../domain/usecase/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRecommendationEvent>(_getRecommendationEvent);
  }

  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationUsecase getRecommendationUsecase;

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUsecase(MovieDetailParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsSate: RequestSate.error,
            movieDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetails: r, movieDetailsSate: RequestSate.loaded)));
  }

  Future<FutureOr<void>> _getRecommendationEvent(
      GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUsecase(RecommendationParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationSate: RequestSate.error,
            recommendationMessage: l.message)),
        (r) => emit(state.copyWith(
            recommendation: r, recommendationSate: RequestSate.loaded)));
  }
}
