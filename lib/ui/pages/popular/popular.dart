import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/details_movies_model.dart';
import 'package:movie_app/ui/global_controllers/service_api_controller.dart';
import 'package:movie_app/ui/pages/details/datils_controller.dart';
import 'package:movie_app/ui/pages/popular/widgets/movie_card_popular_widget.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';
import 'package:provider/provider.dart';

class PopularPage extends StatelessWidget {
  final String? idMovie; 
  
  const PopularPage({ Key? key, this.idMovie }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String idMOvie = ModalRoute.of(context)!.settings.arguments.toString();
    final ServiceApiController serviceApiController = Provider.of<ServiceApiController>(context, listen: false);
    
    final Responsive resposive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular',style: textStyleCustom.textAppbar),
        elevation: 0,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon:  Icon(Icons.arrow_back_ios)
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: serviceApiController.getDetailsMovies(idMOvie) ,
          builder: (BuildContext context, AsyncSnapshot<ResponseDetailsMovies?> snapshot) {
            final DetailsController detailsController = Provider.of<DetailsController>(context, listen: false);
            if (snapshot.hasData){
              final ResponseDetailsMovies detailsMovie = snapshot.data!;
              serviceApiController.updateDetailMovie = detailsMovie;
              final String pathUrl =  detailsMovie.backdropPath ?? detailsMovie.posterPath!;
              // print(detailsMovie.numberOfSeasons); 
              // print(detailsMovie.seasons![0].episodeCount); 
              return  MovieCardPopular(
                nameMovie: detailsMovie.name,
                urlImage: 'https://image.tmdb.org/t/p/original'+ pathUrl,
                iMDB: detailsMovie.voteAverage.toString(),
                onTap: (){
                   Navigator.pushNamed(context, 'details');
                   detailsController.changeEpisode = 1;
                } ,
              );
            }
            return Center(child: CupertinoActivityIndicator( radius: 15 ));
          },
        ),
      ),
    );
  }
}
