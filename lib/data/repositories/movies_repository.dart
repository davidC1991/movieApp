import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:movie_app/data/models/recomendations_movies_model.dart';

abstract class MoviesRepository{
  Future<List<ResultPopular>?> getPopularMovies();
  Future<List<ResultRecomendations>?> getRecomendationsMovies();
}