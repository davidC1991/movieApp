import 'package:flutter/material.dart';
import 'package:movie_app/utils/responsive.dart';

class RecentMovieCard extends StatelessWidget {
  const RecentMovieCard({
    Key? key,
    required this.pathUrl,
    required this.responsive,
  }) : super(key: key);
  final String pathUrl;
  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
     borderRadius : BorderRadius.circular(10),
     child : FadeInImage(
       placeholder: AssetImage('assets/no-image.jpg'),
       image: NetworkImage(pathUrl),
       height: responsive.heightPercent(40),
       width:  responsive.widthPercent(80),
       fit: BoxFit.cover
     ) ,
          );
  }
}