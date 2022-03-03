import 'package:flutter/material.dart';
import 'package:movie_app/pages/recent/widgets/recent_card_movie_widget.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return Container(
      padding: EdgeInsets.all(18),
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        
        itemCount: 5,
        itemBuilder: ( _ , i) => recentWidget(responsive, textStyleCustom, context)
      )
    );
  }

  Widget recentWidget(Responsive responsive, TextStyleCustom textStyleCustom, BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        RecentMovieCard(responsive: responsive),
        SizedBox(height: responsive.widthPercent(8)),
        Text('Title Movie', style: textStyleCustom.subTitle),
        SizedBox(height: responsive.widthPercent(5)),
        Text('3 Episode of 20', style: textStyleCustom.textIMDb),
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
    

