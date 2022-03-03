import 'package:flutter/material.dart';
import 'package:movie_app/ui/global_widgets/movie_card.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';


class FavoritesPage extends StatelessWidget {
  const FavoritesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return Container(
        padding: EdgeInsets.all(18),
        alignment: Alignment.topLeft,
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: ( _,i){
            return ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                MovieCard(nameMovie: 'titulo pelicula',urlImage: 'https://via.placeholder.com/150x300', isMovieCardRecomendation: true),
                Divider(color: greyColor.withOpacity(0.3)),
                SizedBox(height: responsive.widthPercent(3),)
              ],
            );
          }
      ),
    );
   
  }
}