import 'package:equatable/equatable.dart';
import 'package:movies/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String backDropPath;
  final List<Genres> genres;
  final int runTime;
  final String overView;
  final double voteAverage;
  final String releaseDate;

  const MovieDetails(
      {required this.id,
      required this.title,
      required this.backDropPath,
      required this.genres,
      required this.runTime,
      required this.overView,
      required this.voteAverage,
      required this.releaseDate});

  @override
  List<Object?> get props => [
        id,
        title,
        backDropPath,
        genres,
        runTime,
        overView,
        voteAverage,
        releaseDate
      ];
}
