import 'package:flutter/material.dart';
import 'package:movie_app/pages/popular/widgets/movie_card_popular.dart';
import 'package:movie_app/utils/responsive.dart';
import 'package:movie_app/utils/text_style.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive resposive = Responsive(context);
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular',style: textStyleCustom.textAppbar),
        elevation: 0,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon:  Icon(Icons.arrow_back_ios)
        ),
      ),
      body: SafeArea(
        child:  MovieCardPopular(nameMovie: 'titulo pelicula',urlImage: 'https://via.placeholder.com/150x300'),
      ),
    );
  }
}