import 'package:movies/movies/data/model/genres_model.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.title,
      required super.backDropPath,
      required super.genres,
      required super.runTime,
      required super.overView,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          id: json['id'],
          title: json['title'],
          backDropPath: json['backdrop_path'],
          runTime: json['runtime'].toInt(),
          genres: List<GenresModel>.from(
              json['genres'].map((g) => GenresModel.fromJson(g))),
          overView: json['overview'],
          voteAverage: json['vote_average'].toDouble(),
          releaseDate: json['release_date']);
}
