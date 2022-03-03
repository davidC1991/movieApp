
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/global_widgets/rounded_button.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';

class MovieCardPopular extends StatelessWidget {
  final String? nameMovie, urlImage;
  MovieCardPopular({required this.nameMovie,this.urlImage});
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return Container(
      alignment: Alignment.center,
      margin : EdgeInsets.symmetric(horizontal: responsive.diagonalPercent(0)) ,
      width  : responsive.widthPercent(100),
      height : responsive.heightPercent(100),
      child  : movieCardPopular(responsive, textStyleCustom, context)
    );
  }
  
  Column movieCardPopular(Responsive responsive, TextStyleCustom textStyleCustom, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: responsive.heightPercent(4)),
        GestureDetector(
          onTap: (){
          //  Navigator.pushNamed(context, 'popular');
          },
          child: ClipRRect(
            borderRadius : BorderRadius.circular(10),
            child : FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(this.urlImage!),
              height: responsive.heightPercent(50),
              width:  responsive.widthPercent(69),
              fit: BoxFit.cover
            ) ,
          ),
        ),
        SizedBox(height: responsive.heightPercent(2.5)),
        Text(
          this.nameMovie!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: textStyleCustom.textPopularMovie,
        ),
        SizedBox(height: responsive.heightPercent(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  List.generate(5,(index) => Icon(Icons.star, color: greyColor, size: 20,)
        ),
        ),
        SizedBox(height: responsive.heightPercent(2)),
        Text('IMDb:  9,4', style: textStyleCustom.textIMDb),
        SizedBox(height: responsive.heightPercent(2)),
        RoundedButton(
          fullWidth: false,
          backgroundColor: yellowColor,
          width: responsive.widthPercent(40),
          height: responsive.heightPercent(5),
          label: 'Watch Now',
          onPressed: (){
            Navigator.pushReplacementNamed(context, 'details');
           },
        ),
      ],
    );
  }
}