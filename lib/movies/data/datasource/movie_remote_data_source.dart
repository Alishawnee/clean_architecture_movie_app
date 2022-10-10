import 'package:dio/dio.dart';
import 'package:movies/core/error/excaptions.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/movies/data/model/movie_details_model.dart';
import 'package:movies/movies/data/model/movie_model.dart';
import 'package:movies/movies/domain/usecase/get_movie_details_usecase.dart';

import '../../domain/entities/recommendation.dart';
import '../../domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailParameters parameters);
  Future<List<Recommendation>> getRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List.from(
          (response.data['results']).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExcaption(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.getPopularMovies);

    if (response.statusCode == 200) {
      return List.from(response.data['results'])
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerExcaption(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.getTopRatedMovies);

    if (response.statusCode == 200) {
      return List.from(
          (response.data['results'].map((e) => MovieModel.fromJson(e))));
    } else {
      throw ServerExcaption(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerExcaption(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendation>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<Recommendation>.from(
          (response.data['results']).map((e) => MovieDetailsModel.fromJson(e)));
    } else {
      throw ServerExcaption(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
