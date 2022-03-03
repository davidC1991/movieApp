import 'package:flutter/material.dart';
import 'package:movie_app/pages/details/details.dart';
import 'package:movie_app/pages/favorites/favorites.dart';
import 'package:movie_app/pages/home/home.dart';
import 'package:movie_app/pages/pageView/pageView.dart';
import 'package:movie_app/pages/popular/popular.dart';
import 'package:movie_app/pages/recent/recent.dart';
import 'package:movie_app/pages/recentDetails/details_recent.dart';
import 'package:movie_app/pages/signIn/sign_in.dart';
import 'package:movie_app/pages/welcome/welcome_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {  
    'welcome' : ( _ )=> WelcomePage(),
    'signIn'  : ( _ )=> SignInPage(),
    'home'    : ( _ )=> HomePage(),
    'pageView': ( _ )=> PageViewScreen(),
    'popular'   : ( _ )=>  PopularPage(),
    'details'   : ( _ )=>  DetailsPage(),
    'favorites' : ( _ )=>  FavoritesPage(),
    'recent'    : ( _ )=>  RecentPage(),
    'detailsRecent'    : ( _ )=>  DetailsRecentPage(),
};