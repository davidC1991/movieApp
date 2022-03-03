import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/models/details_movies_model.dart';
import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:movie_app/data/models/recomendations_movies_model.dart';

class FavoritesMoviesControllers extends ChangeNotifier{
   List<ResponseDetailsMovies> _favoritesListPopular = [];
   List<ResultRecomendations> _favoritesListRecomendations = [];
    
   List<ResponseDetailsMovies> get favoritesListPopular => this._favoritesListPopular; 
   List<ResultRecomendations> get favoritesListRecomendations => this._favoritesListRecomendations; 
   
   List<dynamic> get totalListRecomendations {
    //return this._favoritesListRecomendations+this._favoritesListRecomendations; 
    List<dynamic> listNew = [this._favoritesListRecomendations, this._favoritesListPopular].expand((x) => x).toList();
    return listNew;
   }

   set addFavoriteMoviePopular(ResponseDetailsMovies moviePopular) => this._favoritesListPopular.add(moviePopular);
   set addFavoriteMovieRecomendations(ResultRecomendations movieRecomendations) => this._favoritesListRecomendations.add(movieRecomendations);


}