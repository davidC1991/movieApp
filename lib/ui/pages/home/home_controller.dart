import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:movie_app/data/models/recomendations_movies_model.dart';
import 'package:movie_app/data/repositories_implementation/movies_repository_impl.dart';
import 'package:movie_app/data/services/movies_service.dart';

class HomeController extends ChangeNotifier{
  MovieRepositoryimpl movieRepositoryimpl = MovieRepositoryimpl(MoviesService());

  Future<List<ResultPopular>?> getPopularMovies()async{
    return await movieRepositoryimpl.getPopularMovies();
  }

  Future<List<ResultRecomendations>?> getRecomendationsMovies()async{
    return await movieRepositoryimpl.getRecomendationsMovies();
  }
}