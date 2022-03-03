
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/popular_movies_model.dart';
import 'package:movie_app/ui/global_controllers/favoritos_movie_controllers.dart';
import 'package:movie_app/ui/global_widgets/movie_card.dart';
import 'package:movie_app/ui/global_controllers/service_api_controller.dart';
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
    final ServiceApiController serviceApiController = Provider.of<ServiceApiController>(context, listen: false);
    
    return FutureBuilder(
      future: serviceApiController.getPopularMovies(),
      builder: ( context , AsyncSnapshot<List<ResultPopular>?> snapshot){
        if (snapshot.hasData){
          final List<ResultPopular> _listPopularMovies = snapshot.data!;
          return movieCardPopularWidget(_listPopularMovies, context, serviceApiController);
        }
        return Center(child: CupertinoActivityIndicator( radius: 15 ));
      }
    );
  }

  Container movieCardPopularWidget( List<ResultPopular> listPopularMovies, BuildContext context, ServiceApiController serviceApiController) {
   
    return Container(
    width  : resposive.widthPercent(100),
    height : resposive.heightPercent(35),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listPopularMovies.length,
      itemBuilder: (_,i){ 
        final String pathUrl =  listPopularMovies[i].backdropPath ?? listPopularMovies[i].posterPath ?? 'https://via.placeholder.com/150x300';
        return MovieCard(
         nameMovie: listPopularMovies[i].name,
         urlImage: 'https://image.tmdb.org/t/p/w400'+pathUrl,
         isMovieCardRecomendation: false,
         onTap: (){
           serviceApiController.updateIdMovie = listPopularMovies[i].id.toString();
           Navigator.pushNamed(context, 'popular',arguments: listPopularMovies[i].id.toString());
         },
       );
      }
    ),
  );
  }
}
