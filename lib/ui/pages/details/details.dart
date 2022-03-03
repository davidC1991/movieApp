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

class DetailsPage extends StatelessWidget {
  const DetailsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    //final Map<String,dynamic> dataEpisode = ModalRoute.of(context)!.settings.arguments as Map<String ,dynamic>;
    final ServiceApiController serviceApiController = Provider.of<ServiceApiController>(context, listen: false);
    final DetailsController detailsController = Provider.of<DetailsController>(context);
    final FavoritesMoviesControllers favoritesMoviesControllers = Provider.of<FavoritesMoviesControllers>(context, listen: false);
    //print(dataEpisode);
    return Scaffold(
      appBar: AppBar(
        title: Text('title movie',style: textStyleCustom.textAppbar),
        elevation: 0,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon:  Icon(Icons.arrow_back_ios)
        ),
        actions: [
          IconButton(
            onPressed: ()=> favoritesMoviesControllers.addFavoriteMoviePopular = serviceApiController.detailsMovie!,
            icon: Icon(Icons.ac_unit_rounded, color: greyColor) 
          )
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: serviceApiController.getEpisodeMovies(serviceApiController.idMovie!, '1' , detailsController.currentEpisode.toString()),
          builder: (BuildContext context, AsyncSnapshot<ResponseEpisodeMovies?> snapshot) {
            if (snapshot.hasData){
              final ResponseEpisodeMovies _episode = snapshot.data!;
              //print(_episode.overview);
              return detailsMovieWidget(responsive, textStyleCustom, _episode, serviceApiController.detailsMovie!);
            }
            return Center(child: CupertinoActivityIndicator());
          },
        ),
      ),
    );
  }

  Container detailsMovieWidget(Responsive responsive, TextStyleCustom textStyleCustom, ResponseEpisodeMovies episode, ResponseDetailsMovies detailsMovie) {
    
    return Container(
        padding: EdgeInsets.all(18),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
