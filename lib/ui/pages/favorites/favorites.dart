import 'package:flutter/material.dart';
import 'package:movie_app/ui/global_controllers/favoritos_movie_controllers.dart';
import 'package:movie_app/ui/global_widgets/movie_card.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:provider/provider.dart';


class FavoritesPage extends StatelessWidget {
  const FavoritesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    final FavoritesMoviesControllers favoritesMoviesControllers = Provider.of<FavoritesMoviesControllers>(context, listen: false);
    print(favoritesMoviesControllers.totalListRecomendations);
    return Container(
        padding: EdgeInsets.all(18),
        alignment: Alignment.topLeft,
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: favoritesMoviesControllers.totalListRecomendations.length,
          itemBuilder: ( _,i){
            final String pathUrl =  favoritesMoviesControllers.totalListRecomendations[i].backdropPath ?? favoritesMoviesControllers.totalListRecomendations[i].posterPath ?? 'https://via.placeholder.com/150x300';
            return ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                MovieCard(
                  isFavorite: true,
                  nameMovie: favoritesMoviesControllers.totalListRecomendations[i].name,
                  urlImage:  'https://image.tmdb.org/t/p/w400'+ pathUrl,
                  isMovieCardRecomendation: true
                ),
                Divider(color: greyColor.withOpacity(0.3)),
                SizedBox(height: responsive.widthPercent(3),)
              ],
            );
          }
      ),
    );
   
  }
}