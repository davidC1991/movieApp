
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/episode_movie_model.dart';
import 'package:movie_app/ui/global_controllers/service_api_controller.dart';
import 'package:movie_app/ui/pages/details/datils_controller.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';
import 'package:provider/provider.dart';

class MenuEpisode extends StatelessWidget {
  const MenuEpisode({
    Key? key,
    required this.episode,
    required this.responsive,
    required this.textStyleCustom,
  }) : super(key: key);

  final Responsive responsive;
  final TextStyleCustom textStyleCustom;
  final ResponseEpisodeMovies episode;

  @override
  Widget build(BuildContext context) {
    final DetailsController detailsController = Provider.of<DetailsController>(context, listen: false);
    final ServiceApiController serviceApiController = Provider.of<ServiceApiController>(context, listen: false);
    return Container(
      width: responsive.widthPercent(90),
      height: responsive.heightPercent(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(episode.episodeNumber.toString()+' Episode', style: textStyleCustom.textTitle),  
          GestureDetector(
            onTap: (){
              final maxNumEpisodes = serviceApiController.detailsMovie!.seasons![0].episodeCount;
              final increaseEpisode = detailsController.currentEpisode.toInt();
              detailsController.changeEpisode= increaseEpisode == maxNumEpisodes?
                                                detailsController.changeEpisode = 1
                                                :increaseEpisode+1;
             
            },
            child: Text('Next', style: textStyleCustom.textAppbar))  
       ],
     ),
    );
  }
}
