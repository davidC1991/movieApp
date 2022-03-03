
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:movie_app/data/models/recomendations_movies_model.dart';
import 'package:movie_app/ui/global_widgets/movie_card.dart';
import 'package:movie_app/ui/pages/home/home_controller.dart';
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
    final HomeController homeController = Provider.of<HomeController>(context, listen: false);
    return FutureBuilder(
      future: homeController.getRecomendationsMovies(),
      builder: ( _ , AsyncSnapshot<List<ResultRecomendations>?> snapshot ){
        
        if (snapshot.hasData){
          final List<ResultRecomendations>? _listRecomendatedMovies = snapshot.data;
          return cardsRecomendationsMoviesWidget(_listRecomendatedMovies);
        }
        return CircularProgressIndicator();
      }
    );
  }

  ListView cardsRecomendationsMoviesWidget(List<ResultRecomendations>? listRecomendatedMovies ) {
    return ListView.builder(
    shrinkWrap: true,
    physics: ScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: listRecomendatedMovies!.length,
    itemBuilder: (_,i)=> MovieCard(
      nameMovie: listRecomendatedMovies[i].title,
      urlImage: 'https://image.tmdb.org/t/p/w400'+listRecomendatedMovies[i].backdropPath!,
      iMDB: listRecomendatedMovies[i].voteAverage.toString(),
      isMovieCardRecomendation: true
    )
   );
  }
}
