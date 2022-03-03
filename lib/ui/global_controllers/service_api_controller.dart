import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/models/details_movies_model.dart';
import 'package:movie_app/data/models/episode_movie_model.dart';
import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:movie_app/data/models/recomendations_movies_model.dart';
import 'package:movie_app/data/models/video_movie_model.dart';
import 'package:movie_app/data/repositories_implementation/movies_repository_impl.dart';
import 'package:movie_app/data/services/movies_service.dart';

class ServiceApiController extends ChangeNotifier{
  MovieRepositoryimpl movieRepositoryimpl = MovieRepositoryimpl(MoviesService());

  ResponseEpisodeMovies? _episode;
  ResponseDetailsMovies? _detailsMovie;
  ResponseVideoMovies? _videoMovie;
  String? _idMovie;
  

  ResponseEpisodeMovies? get episode => this._episode;
  ResponseDetailsMovies? get detailsMovie => this._detailsMovie;
  ResponseVideoMovies?   get videoMovie => this._videoMovie;
  String? get idMovie => this._idMovie;

  set updateEpisode(ResponseEpisodeMovies? episode) => this._episode = episode;
  set updateDetailMovie(ResponseDetailsMovies? detailMovie) => this._detailsMovie = detailMovie;
  set updateVideoMovie(ResponseVideoMovies? videoMovie) => this._videoMovie = videoMovie;
  set updateIdMovie(String idMovie) => this._idMovie = idMovie;
  
  Future<List<ResultPopular>?> getPopularMovies()async{
    return await movieRepositoryimpl.getPopularMovies();
  }

  Future<List<ResultRecomendations>?> getRecomendationsMovies()async{
    return await movieRepositoryimpl.getRecomendationsMovies();
  }
 
  Future<ResponseDetailsMovies?> getDetailsMovies(String id)async{
    final detailMovie = await movieRepositoryimpl.getDetailsMovies(id);
    updateDetailMovie = detailsMovie;
    return detailMovie;
  }


  Future<ResponseEpisodeMovies?> getEpisodeMovies(String id, String seasonNumber, String episodeNumber)async{
    final episode = await movieRepositoryimpl.getEpisodeMovie(id, seasonNumber, episodeNumber);
    final video = await getVideoMovies(id, seasonNumber, episodeNumber);
    updateEpisode = episode;
    return episode;
  }
  
   Future<ResponseVideoMovies?> getVideoMovies(String id, String seasonNumber, String episodeNumber)async{
    final videoMovie = await movieRepositoryimpl.getVideoMovie(id, seasonNumber, episodeNumber);
    updateVideoMovie = videoMovie;
    return videoMovie;
  }

}