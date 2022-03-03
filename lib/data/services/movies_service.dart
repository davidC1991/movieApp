import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/data/models/recomendations_movies_model.dart';

class MoviesService{
  
  
  ResponsePopularMovies responsePopularMovies = ResponsePopularMovies();
  ResponseRecomendationsMovies responseRecomendationsMovies = ResponseRecomendationsMovies();

  final String _baseUrl = 'api.themoviedb.org';
  String _detailUrlPath = '';
  String _keyApi = '83042df0ddb3c2e70ce8526cb6b47296';
  
  
  
  Future<List<ResultPopular>?> getPopularMovies()async{
 
    this._detailUrlPath = '/3/movie/popular';
    var url = Uri.https(_baseUrl, _detailUrlPath,{
      'api_key' : _keyApi,
      'language': 'en-US&page=1'
    } );

    final response   = await http.get(url);
  
    if (response.statusCode == 200){
      ResponsePopularMovies moviesPopularResult = ResponsePopularMovies.fromMap(json.decode(response.body));
      return moviesPopularResult.results; 
    }
   
    return null;  
  }


   Future<List<ResultRecomendations>?> getRecomendationsMovies()async{
 
    this._detailUrlPath = '/3/movie/top_rated';
    var url = Uri.https(_baseUrl, _detailUrlPath,{
      'api_key' : _keyApi,
      'language': 'en-US&page=1'
    } );

    final response   = await http.get(url);
  
    if (response.statusCode == 200){
      ResponseRecomendationsMovies responseRecomendationsMovies = ResponseRecomendationsMovies.fromMap(json.decode(response.body));
      return responseRecomendationsMovies.results; 
    }
   
    return null;  
  }


}


