import 'package:movie_app/data/models/details_movies_model.dart';
import 'package:movie_app/data/models/episode_movie_model.dart';
import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:movie_app/data/models/recomendations_movies_model.dart';
import 'package:movie_app/data/models/video_movie_model.dart';
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

  @override
  Future<ResponseDetailsMovies?> getDetailsMovies(String id)async {
    return moviesService.getDetailsMovies(id);
  }

  @override
  Future<ResponseEpisodeMovies?> getEpisodeMovie(String id, String seasonNumber, String episodeNumber) {
   return moviesService.getEpisodeMovie(id, seasonNumber, episodeNumber);
  }

  @override
  Future<ResponseVideoMovies?> getVideoMovie(String id, String seasonNumber, String episodeNumber) {
    return moviesService.getVideoMovie(id, seasonNumber, episodeNumber);
  }

}