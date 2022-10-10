import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies/core/utills/enums.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movie_repository.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/usecase/get_now_palying_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controllers/movies_event.dart';
import 'package:movies/movies/presentation/controllers/movies_state.dart';
import 'package:get_it/get_it.dart';

import '../../../core/usecase.dart/base_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPalyingMoviesUsecase getNowPalyingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MoviesBloc(this.getNowPalyingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPalyingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  Future<FutureOr<void>> _getNowPalyingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPalyingMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
          nowPlayingState: RequestSate.error, nowPlayigMessage: l.message)),
      (r) => emit(state.copyWith(
          nowPlayingMovies: r, nowPlayingState: RequestSate.loaded)),
    );
  }

  Future<FutureOr<void>> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase(const NoParameters());
    emit(const MoviesState(popularState: RequestSate.loaded));
    result.fold(
      (l) => emit(state.copyWith(
          popularState: RequestSate.error, popularMessage: l.message)),
      (r) => emit(
          state.copyWith(popularMovies: r, popularState: RequestSate.loaded)),
    );
  }

  Future<FutureOr<void>> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());
    emit(const MoviesState(topRatedState: RequestSate.loaded));
    result.fold(
      (l) => emit(state.copyWith(
          topRatedState: RequestSate.error, topRatedMessage: l.message)),
      (r) => emit(
          state.copyWith(topRatedMovies: r, topRatedState: RequestSate.loaded)),
    );
  }
}
