
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/recomendations_movies_model.dart';
import 'package:movie_app/ui/global_controllers/favoritos_movie_controllers.dart';
import 'package:movie_app/ui/global_widgets/movie_card.dart';
import 'package:movie_app/ui/global_controllers/service_api_controller.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:provider/provider.dart';

class RecomendationsMovies extends StatelessWidget {
  const RecomendationsMovies({
    Key? key,
    required this.resposive,
  }) : super(key: key);

  final Responsive resposive;

  @override
  Widget build(BuildContext context) {
    final ServiceApiController serviceApiController = Provider.of<ServiceApiController>(context, listen: false);
    return FutureBuilder(
      future: serviceApiController.getRecomendationsMovies(),
      builder: ( _ , AsyncSnapshot<List<ResultRecomendations>?> snapshot ){
        
        if (snapshot.hasData){
          final List<ResultRecomendations>? _listRecomendatedMovies = snapshot.data;
          return cardsRecomendationsMoviesWidget(_listRecomendatedMovies, context);
        }
        return Center(child: CupertinoActivityIndicator( radius: 15 ));
      }
    );
  }

  ListView cardsRecomendationsMoviesWidget(List<ResultRecomendations>? listRecomendatedMovies, BuildContext context ) {
    final FavoritesMoviesControllers favoritesMoviesControllers = Provider.of<FavoritesMoviesControllers>(context, listen: false);
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: listRecomendatedMovies!.length,
      itemBuilder: (_,i){
        final String pathUrl =  listRecomendatedMovies[i].backdropPath ?? listRecomendatedMovies[i].posterPath!;// ?? 'https://via.placeholder.com/150x300';
        return MovieCard(
          nameMovie: listRecomendatedMovies[i].name,
          urlImage: 'https://image.tmdb.org/t/p/w400'+ pathUrl,
          iMDB: listRecomendatedMovies[i].voteAverage.toString(),
          isMovieCardRecomendation: true,
          onTapLike: (){
            favoritesMoviesControllers.addFavoriteMovieRecomendations= listRecomendatedMovies[i]; 
          //mensajePantalla('Movie Favorite added'); 
        },
     );
    }
   );
  }
}
