part of 'movie_details_bloc.dart';

@immutable
class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsSate = RequestSate.loading,
      this.movieDetailsMessage = '',
      this.recommendation = const [],
      this.recommendationSate = RequestSate.loading,
      this.recommendationMessage = ''});

  final MovieDetails? movieDetails;
  final RequestSate movieDetailsSate;
  final String movieDetailsMessage;
  final List<Recommendation> recommendation;
  final RequestSate recommendationSate;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestSate? movieDetailsSate,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    RequestSate? recommendationSate,
    String? recommendationMessage,
  }) =>
      MovieDetailsState(
          movieDetails: movieDetails ?? this.movieDetails,
          movieDetailsSate: movieDetailsSate ?? this.movieDetailsSate,
          movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
          recommendation: recommendation ?? this.recommendation,
          recommendationSate: recommendationSate ?? this.recommendationSate,
          recommendationMessage:
              recommendationMessage ?? this.recommendationMessage);

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsSate,
        movieDetailsMessage,
        recommendation,
        recommendationSate,
        recommendationMessage
      ];
}
