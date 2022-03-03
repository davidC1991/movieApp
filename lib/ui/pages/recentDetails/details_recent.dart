import 'package:flutter/material.dart';
import 'package:movie_app/ui/global_widgets/movie_video_card_widget.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';

class DetailsRecentPage extends StatelessWidget {
  const DetailsRecentPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('title movie-',style: textStyleCustom.textAppbar),
        elevation: 0,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon:  Icon(Icons.arrow_back_ios)
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(18),
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
             shrinkWrap: true,
            itemCount: 5,
            itemBuilder: ( _ , i ) => movieVideoCardRecent(textStyleCustom, responsive)
          )
        ),
      ),
    );
  }

  Widget movieVideoCardRecent(TextStyleCustom textStyleCustom, Responsive responsive) {
    return Column(
          children: [
            Text('3 Episode', style: textStyleCustom.subTitle),
            SizedBox(height: responsive.widthPercent(5)),
            MovieVideoCard(responsive: responsive),
            SizedBox(height: responsive.widthPercent(5)),
            SizedBox(
             width: responsive.widthPercent(75),
             child: Divider(color: greyColor.withOpacity(0.3))),
            SizedBox(height: responsive.widthPercent(5)),
          ],
        );
  }
}
       