import 'package:equatable/equatable.dart';
import 'package:movies/core/utills/enums.dart';
import 'package:movies/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestSate nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> popularMovies;
  final RequestSate popularState;
  final String popularMessage;

  final List<Movie> topRatedMovies;
  final RequestSate topRatedState;
  final String topRatedMessage;
  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestSate.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestSate.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestSate.loading,
    this.topRatedMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestSate? nowPlayingState,
    String? nowPlayigMessage,
    List<Movie>? popularMovies,
    RequestSate? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestSate? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMessage: nowPlayigMessage ?? this.nowPlayingMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage);
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage
      ];
}
