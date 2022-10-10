import 'package:movies/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backDropPath,
      required super.genreIds,
      required super.overView,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['original_title'],
      backDropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids']).map((e) => e).toList(),
      overView: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date']);
}
