import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movie_app/data/services/movies_service.dart';

import 'package:movie_app/preferences/auth_preference.dart';
import 'package:movie_app/ui/pages/favorites/favorites.dart';
import 'package:movie_app/ui/pages/home/home.dart';
import 'package:movie_app/ui/pages/pageView/pageView_controller.dart';
import 'package:movie_app/ui/pages/pageView/widgets/menuNavigationBar_widget.dart';

import 'package:movie_app/ui/pages/recent/recent.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/text_style.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PageViewScreen extends StatelessWidget {
  final AuthPreference authPreference = AuthPreference(); 
  MoviesService moviesService = MoviesService();
  @override
  Widget build(BuildContext context) {
    moviesService.getPopularMovies();
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    PageViewController pageViewController = Provider.of<PageViewController>(context, listen: true);
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(pageViewController.titlePage,style:  textStyleCustom.textAppbar),
        actions: [
          IconButton(
            onPressed: (){
              authPreference.setUserLogin = false;
              Navigator.pushNamedAndRemoveUntil(context, 'welcome', (route) => false);
            },
            icon: Icon(Ionicons.cog_outline, color: greyColor, size: 30)
          )
        ],
      ),
      body: PageView(
        controller: pageViewController.pageController,
        children: [
          HomePage(),
          FavoritesPage(),
          RecentPage(),
          Container(child: Center(child: Text('pagina 4')), width: double.infinity, height: double.infinity,),
        ],
      ),
      bottomNavigationBar: MenuNavigationBar(),
    );
  }
}

