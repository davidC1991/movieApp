import 'package:flutter/material.dart';
import 'package:movie_app/ui/pages/details/details.dart';
import 'package:movie_app/ui/pages/favorites/favorites.dart';
import 'package:movie_app/ui/pages/home/home.dart';
import 'package:movie_app/ui/pages/pageView/pageView.dart';
import 'package:movie_app/ui/pages/popular/popular.dart';
import 'package:movie_app/ui/pages/recent/recent.dart';
import 'package:movie_app/ui/pages/recentDetails/details_recent.dart';
import 'package:movie_app/ui/pages/signIn/sign_in.dart';
import 'package:movie_app/ui/pages/welcome/welcome_page.dart';


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