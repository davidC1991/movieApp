
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movie_app/ui/global_controllers/favoritos_movie_controllers.dart';
import 'package:movie_app/ui/global_widgets/rounded_button.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class MovieCard extends StatelessWidget {
  final String? nameMovie, urlImage, iMDB;
  final VoidCallback? onTap, onTapLike;
  final bool isMovieCardRecomendation;
  bool isFavorite;
  MovieCard({required this.nameMovie,this.urlImage, required this.isMovieCardRecomendation, this.iMDB : '9,6', this.onTap, this.onTapLike, this.isFavorite = false});
  @override
  Widget build(BuildContext context) {
    final FavoritesMoviesControllers favoritesMoviesControllers = Provider.of<FavoritesMoviesControllers>(context, listen: true);
    final Responsive responsive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return Container(
      alignment: Alignment.bottomLeft,
      margin : EdgeInsets.symmetric(horizontal: responsive.diagonalPercent(0)) ,
      width  : responsive.widthPercent(40),
      height : responsive.heightPercent(22),
      child  : this.isMovieCardRecomendation?movieCardHorizzontal(responsive, textStyleCustom, favoritesMoviesControllers)
                                            :movieCardVertical(responsive, textStyleCustom, context)
    );
  }
  
  Column movieCardVertical(Responsive responsive, TextStyleCustom textStyleCustom, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: this.onTap, 
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
          textAlign: TextAlign.left,
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
  
  getFavoritiesMovie(FavoritesMoviesControllers favoritesMoviesControllers){
    
    try {
      favoritesMoviesControllers.favoritesListRecomendations.firstWhere((element) => element.name == this.nameMovie);
      this.isFavorite = true;
    } catch (e) {
      print(e);
    }
  }
  Row movieCardHorizzontal(Responsive responsive, TextStyleCustom textStyleCustom, FavoritesMoviesControllers favoritesMoviesControllers) {
    
    getFavoritiesMovie(favoritesMoviesControllers);
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
          padding: EdgeInsets.only(top:18),
          height: responsive.heightPercent(20),
          width:  responsive.widthPercent(48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
             Text('IMDb:  '+this.iMDB!, style: textStyleCustom.textIMDb),
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
                 SizedBox(width: responsive.heightPercent(2)),
                 IconButton(
                   onPressed: this.onTapLike,
                   icon: this.isFavorite?Icon(Ionicons.heart, color: yellowColor.withOpacity(0.2), size: responsive.diagonalPercent(3.8),)
                        :Icon(Ionicons.heart_outline, color: greyColor, size: responsive.diagonalPercent(3.8),)
                 )
                 
               ],
             ),
            ],
          ),
        ),
       
      ],
    );
  }
}
              
            