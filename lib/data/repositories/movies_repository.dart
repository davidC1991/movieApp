import 'package:movie_app/data/models/airing_today_model.dart';
import 'package:movie_app/data/models/details_movies_model.dart';
import 'package:movie_app/data/models/episode_movie_model.dart';
import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:movie_app/data/models/recomendations_movies_model.dart';
import 'package:movie_app/data/models/video_movie_model.dart';

abstract class MoviesRepository{
  Future<List<ResultPopular>?> getPopularMovies();
  Future<List<ResultRecomendations>?> getRecomendationsMovies();
  Future<ResponseDetailsMovies?> getDetailsMovies(String id);
  Future<ResponseEpisodeMovies?> getEpisodeMovie(String id, String seasonNumber, String episodeNumber);
  Future<ResponseVideoMovies?> getVideoMovie(String id, String seasonNumber, String episodeNumber);
  Future<List<ResultAiringToday>?> getAiresTodayMovies();
}