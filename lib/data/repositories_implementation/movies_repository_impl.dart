import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:movie_app/data/models/recomendations_movies_model.dart';
import 'package:movie_app/data/repositories/movies_repository.dart';
import 'package:movie_app/data/services/movies_service.dart';

class MovieRepositoryimpl implements MoviesRepository{
  MoviesService moviesService = MoviesService();
  MovieRepositoryimpl(this.moviesService);
  
  @override
  Future<List<ResultPopular>?> getPopularMovies() async{
    return moviesService.getPopularMovies();
  }

  @override
  Future<List<ResultRecomendations>?> getRecomendationsMovies() {
    return moviesService.getRecomendationsMovies();
  }

}