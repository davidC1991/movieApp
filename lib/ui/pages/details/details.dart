import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/details_movies_model.dart';
import 'package:movie_app/data/models/episode_movie_model.dart';
import 'package:movie_app/ui/global_controllers/favoritos_movie_controllers.dart';
import 'package:movie_app/ui/global_controllers/service_api_controller.dart';
import 'package:movie_app/ui/global_widgets/movie_video_card_widget.dart';
import 'package:movie_app/ui/pages/details/datils_controller.dart';
import 'package:movie_app/ui/pages/details/widgets/menu_episode_widget.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';


class DetailsPage extends StatelessWidget {
  DetailsPage({ Key? key }) : super(key: key);
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    final ServiceApiController serviceApiController = Provider.of<ServiceApiController>(context, listen: false);
    final DetailsController detailsController = Provider.of<DetailsController>(context);
    final FavoritesMoviesControllers favoritesMoviesControllers = Provider.of<FavoritesMoviesControllers>(context, listen: true);
    
   
    return Scaffold(
     
      body: SafeArea(
        child: FutureBuilder(
          future: serviceApiController.getEpisodeMovies(serviceApiController.idMovie!, '1' , detailsController.currentEpisode.toString()),
          builder: (BuildContext context, AsyncSnapshot<ResponseEpisodeMovies?> snapshot) {
            if (snapshot.hasData){
              final ResponseEpisodeMovies _episode = snapshot.data!;
              //print(_episode.overview);
              return detailsMovieWidget(responsive, textStyleCustom, _episode, serviceApiController.detailsMovie!, context, favoritesMoviesControllers);
            }
            return Center(child: CupertinoActivityIndicator());
          },
        ),
      ),
    );
  }
  
   getFavoritiesMovie(FavoritesMoviesControllers favoritesMoviesControllers, ResponseDetailsMovies detailsMovie){
    
    try {
      favoritesMoviesControllers.favoritesListPopular.firstWhere((element) => element.name == detailsMovie.name);
      this.isFavorite = true;
    } catch (e) {
      print(e);
    }
  }


  Container titlePageWidget(Responsive responsive, TextStyleCustom textStyleCustom, BuildContext context, ResponseDetailsMovies detailsMovie,FavoritesMoviesControllers favoritesMoviesControllers) {
    
    getFavoritiesMovie(favoritesMoviesControllers,detailsMovie);
    return Container(
           alignment: Alignment.bottomCenter,
           padding: EdgeInsets.only(bottom: responsive.heightPercent(2)),
           width: responsive.widthPercent(100),
           height: responsive.heightPercent(10),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              Container(
                padding: EdgeInsets.zero,
                width: responsive.widthPercent(70),
                height: responsive.heightPercent(5),
                child: Row(
                  children: [
                    IconButton(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.zero,
                      onPressed: ()=> Navigator.pop(context),
                      icon:  Icon(Icons.arrow_back_ios, color: whiteColor,)
                     ),
                    Text(detailsMovie.name!,style: textStyleCustom.textAppbar),
                  ],
                  
                ),
              ),
              IconButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
                onPressed: (){
                  favoritesMoviesControllers.addFavoriteMoviePopular = detailsMovie;
                }, 
                icon: this.isFavorite?Icon(Ionicons.heart, color: yellowColor.withOpacity(0.2), size: responsive.diagonalPercent(3.8),)
                      :Icon(Ionicons.heart_outline, color: greyColor, size: responsive.diagonalPercent(3.8),)
              )  
            ],
          ),
         );
  }
              

 
  Container detailsMovieWidget(Responsive responsive, TextStyleCustom textStyleCustom, ResponseEpisodeMovies episode, ResponseDetailsMovies detailsMovie,BuildContext context, FavoritesMoviesControllers favoritesMoviesControllers) {
    
    return Container(
        padding: EdgeInsets.all(18),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titlePageWidget(responsive, textStyleCustom, context, detailsMovie, favoritesMoviesControllers),
            MenuEpisode(responsive: responsive, textStyleCustom: textStyleCustom, episode: episode),
            SizedBox(height: responsive.heightPercent(2)),
            MovieVideoCard(responsive: responsive, episode: episode),  
            SizedBox(height: responsive.heightPercent(9.5)),
            Text(episode.name!, style: textStyleCustom.textTitle),
            SizedBox(height: responsive.heightPercent(2.5)),  
            Text('IMDB: '+episode.voteAverage.toString()+'  |  '+episode.airDate!.year.toString()+'  |  '+episode.seasonNumber.toString()+' Season', style: textStyleCustom.textIMDb),
            SizedBox(height: responsive.heightPercent(2.5)),
            Divider(color: greyColor.withOpacity(0.5)),
            SizedBox(height: responsive.heightPercent(2.5)),
            Text(episode.overview!,
              overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, maxLines: 7, style: textStyleCustom.textMovie),

          ],
        ),
      );
  }


   
 

}
