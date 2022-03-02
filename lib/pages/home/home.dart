import 'package:flutter/material.dart';
import 'package:movie_app/pages/home/widgets/popular_movies.dart';
import 'package:movie_app/pages/home/widgets/recomendations_movies.dart';
import 'package:movie_app/pages/home/widgets/see_all.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    final Responsive resposive = Responsive(context);
    return Container(
      padding: EdgeInsets.all(18),
      alignment: Alignment.topLeft,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Popular', style: textStyleCustom.subTitle),  
            SizedBox(height: resposive.heightPercent(2)), 
            PopularMovies(resposive: resposive),
            SizedBox(height: resposive.heightPercent(0)), 
            SeeAll(textStyleCustom: textStyleCustom),
            Divider(color: greyColor.withOpacity(0.3), thickness: 0.5), 
            SizedBox(height: resposive.heightPercent(2)), 
            Text('Recommendations', style: textStyleCustom.subTitle),
            SizedBox(height: resposive.heightPercent(2)), 
            RecomendationsMovies(resposive: resposive)   
          ],
        ),
      ),
    );
  }
}
