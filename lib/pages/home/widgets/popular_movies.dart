
import 'package:flutter/material.dart';
import 'package:movie_app/global_widgets/movie_card.dart';
import 'package:movie_app/utils/responsive.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    Key? key,
    required this.resposive,
  }) : super(key: key);

  final Responsive resposive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width  : resposive.widthPercent(100),
      height : resposive.heightPercent(35),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_,i)=> MovieCard(nameMovie: 'titulo pelicula',urlImage: 'https://via.placeholder.com/150x300', isMovieCardRecomendation: false)
      
      ),
    );
  }
}
