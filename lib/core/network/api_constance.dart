class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String key = "2d28886c45bacf326369f5e69cff0fc3";
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$key";
  static const String getPopularMovies = "$baseUrl/movie/popular?api_key=$key";
  static const String getTopRatedMovies =
      "$baseUrl/movie/top_rated?api_key=$key";
  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$key";

  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$key";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";
}
