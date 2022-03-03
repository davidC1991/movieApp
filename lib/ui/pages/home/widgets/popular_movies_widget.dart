
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:movie_app/ui/global_widgets/movie_card.dart';
import 'package:movie_app/ui/pages/home/home_controller.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:provider/provider.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({
    Key? key,
    required this.resposive,
  }) : super(key: key);

  final Responsive resposive;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Provider.of<HomeController>(context, listen: false);
    return FutureBuilder(
      future: homeController.getPopularMovies(),
      builder: ( _ , AsyncSnapshot<List<ResultPopular>?> snapshot){
        if (snapshot.hasData){
          final List<ResultPopular> _listPopularMovies = snapshot.data!;
          return movieCardPopularWidget(_listPopularMovies);
        }
        return CircularProgressIndicator();
      }
    );
  }

  Container movieCardPopularWidget( List<ResultPopular> listPopularMovies) {
    
    return Container(
    width  : resposive.widthPercent(100),
    height : resposive.heightPercent(35),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listPopularMovies.length,
      itemBuilder: (_,i)=> MovieCard(
         nameMovie: listPopularMovies[i].title,
         urlImage: 'https://image.tmdb.org/t/p/w400'+listPopularMovies[i].backdropPath!,
         isMovieCardRecomendation: false
      )
    ),
  );
  }
}
