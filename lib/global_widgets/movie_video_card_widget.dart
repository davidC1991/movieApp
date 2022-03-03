
import 'package:flutter/material.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';

class MovieVideoCard extends StatelessWidget {
  const MovieVideoCard({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children:[ 
       
       ClipRRect(
        borderRadius : BorderRadius.circular(10),
        child : FadeInImage(
         placeholder: AssetImage('assets/no-image.jpg'),
         image: NetworkImage( 'https://via.placeholder.com/150x300'),
         height: responsive.heightPercent(30),
         width:  responsive.widthPercent(90),
         fit: BoxFit.cover
       ) ,
      ),
       Positioned.fill(
         child: IconButton(
           onPressed: (){},
           icon: Icon(Icons.play_circle_sharp, color: yellowColor, size: 60) 
         ),
       ), 
     ]
    );
  }
}