
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/airing_today_model.dart';
import 'package:movie_app/ui/pages/recent/widgets/recent_card_movie_widget.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';

class RecentWidget extends StatelessWidget {
  final ResultAiringToday? todayMovie;
  const RecentWidget({
    Key? key,
    required this.todayMovie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    final String? pathUrl =  todayMovie!.backdropPath ?? todayMovie!.posterPath!;
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        RecentMovieCard(responsive: responsive,pathUrl: pathUrl==null?'https://via.placeholder.com/150x300':'https://image.tmdb.org/t/p/w400'+pathUrl),
        SizedBox(height: responsive.widthPercent(8)),
        Align(
          alignment: Alignment.center,
          child: Text(todayMovie!.name!, style: textStyleCustom.subTitle)),
        SizedBox(height: responsive.widthPercent(5)),
        Align(
          alignment: Alignment.center,
          child: Text('3 Episode of 20', style: textStyleCustom.textIMDb)),
        SizedBox(height: responsive.widthPercent(5)),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'detailsRecent'),
            child: Text('Go to view', style: textStyleCustom.textYellow))),
        SizedBox(height: responsive.widthPercent(5)),
        SizedBox(
          width: responsive.widthPercent(75),
          child: Divider(color: greyColor.withOpacity(0.3))),
        SizedBox(height: responsive.widthPercent(5)),
      ],
    );
  }
}
    

