
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/episode_movie_model.dart';
import 'package:movie_app/ui/global_controllers/service_api_controller.dart';
import 'package:movie_app/ui/pages/details/datils_controller.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:provider/provider.dart';

class MovieVideoCard extends StatelessWidget {
  const MovieVideoCard({
    Key? key,
    this.episode,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;
  final ResponseEpisodeMovies? episode;

  @override
  Widget build(BuildContext context) {
    final ServiceApiController serviceApiController = Provider.of<ServiceApiController>(context, listen: false);
    final String? pathUrl =  serviceApiController.detailsMovie!.backdropPath ?? serviceApiController.detailsMovie!.posterPath!;
    final bool hasVideo = serviceApiController.videoMovie!.results!.isEmpty?false:true; 
   
  
    return Stack(
      alignment: Alignment.center,
      children:[ 
       
       ClipRRect(
        borderRadius : BorderRadius.circular(10),
        child : FadeInImage(
         placeholder: AssetImage('assets/no-image.jpg'),
         image: NetworkImage( pathUrl==null?'https://via.placeholder.com/150x300':'https://image.tmdb.org/t/p/w400'+pathUrl),
         height: responsive.heightPercent(30),
         width:  responsive.widthPercent(90),
         fit: BoxFit.cover
       ) ,
      ),
       hasVideo?Positioned.fill(
         child: IconButton(
           onPressed: (){},
           icon: Icon(Icons.play_circle_sharp, color: yellowColor, size: 60) 
         ),
       ):Container(), 
     ]
    );
  }
}