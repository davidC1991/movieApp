
import 'package:flutter/material.dart';
import 'package:movie_app/global_widgets/movie_card.dart';
import 'package:movie_app/utils/responsive.dart';

class RecomendationsMovies extends StatelessWidget {
  const RecomendationsMovies({
    Key? key,
    required this.resposive,
  }) : super(key: key);

  final Responsive resposive;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (_,i)=> MovieCard(nameMovie: 'titulo pelicula',urlImage: 'https://via.placeholder.com/150x300', isMovieCardRecomendation: true,)
    
    );
  }
}
