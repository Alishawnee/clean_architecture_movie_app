import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movie_repository.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/usecase/get_now_palying_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:movies/movies/presentation/controllers/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    // use case
    sl.registerLazySingleton(() => GetNowPalyingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUsecase(sl()));

//repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    //datacource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
