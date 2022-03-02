
import 'package:flutter/material.dart';
import 'package:movie_app/global_widgets/rounded_button.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';

class MovieCard extends StatelessWidget {
  final String? nameMovie, urlImage;
  final bool isMovieCardRecomendation;
  MovieCard({required this.nameMovie,this.urlImage, required this.isMovieCardRecomendation});
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return Container(
      margin : EdgeInsets.symmetric(horizontal: responsive.diagonalPercent(0)) ,
      width  : responsive.widthPercent(40),
      height : responsive.heightPercent(22),
      child  : this.isMovieCardRecomendation?movieCardHorizzontal(responsive, textStyleCustom):movieCardVertical(responsive, textStyleCustom, context)
    );
  }
  
  Column movieCardVertical(Responsive responsive, TextStyleCustom textStyleCustom, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
           Navigator.pushNamed(context, 'popular');
          },
          child: ClipRRect(
            borderRadius : BorderRadius.circular(10),
            child : FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(this.urlImage!),
              height: responsive.heightPercent(25),
              width:  responsive.widthPercent(35),
              fit: BoxFit.cover
            ) ,
          ),
        ),
        SizedBox(height: responsive.heightPercent(0.5)),
        Text(
          this.nameMovie!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: textStyleCustom.textMovie,
        ),
        SizedBox(height: responsive.heightPercent(1)),
        Row(
          children:  List.generate(5,(index) => Icon(Icons.star, color: greyColor, size: 15,)
        ),
        )
      ],
    );
  }

  Row movieCardHorizzontal(Responsive responsive, TextStyleCustom textStyleCustom) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius : BorderRadius.circular(10),
          child : FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage(this.urlImage!),
            height: responsive.heightPercent(20),
            width:  responsive.widthPercent(35),
            fit: BoxFit.cover
          ) ,
        ),
        SizedBox(width: responsive.heightPercent(3)),
        Container(
          padding: EdgeInsets.only(top:25),
          height: responsive.heightPercent(20),
          width:  responsive.widthPercent(48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                this.nameMovie!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: textStyleCustom.textMovie,
              ),
             Row(
               children:  List.generate(5,(index) => Icon(Icons.star, color: greyColor, size: 15,)
              ),
             ),
             Text('IMDb:  9,4', style: textStyleCustom.textIMDb),
             Row(
               children: [
                 RoundedButton(
                  fullWidth: false,
                  backgroundColor: yellowColor,
                  width: responsive.widthPercent(30),
                  height: responsive.heightPercent(5),
                  label: 'Watch Now',
                  onPressed: (){ },
                 ),
                 SizedBox(width: responsive.heightPercent(3.8)),
                 Icon(Icons.label_important_outline, color: greyColor, size: 40,) 
               ],
             ),
            ],
          ),
        ),
       
      ],
    );
  }
}
              
            