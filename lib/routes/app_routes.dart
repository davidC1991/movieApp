import 'package:flutter/material.dart';
import 'package:movie_app/pages/home/home.dart';
import 'package:movie_app/pages/pageView/pageView.dart';
import 'package:movie_app/pages/signIn/sign_in.dart';
import 'package:movie_app/pages/welcome/welcome_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {  
    'welcome' : ( _ )=> WelcomePage(),
    'signIn'  : ( _ )=> SignInPage(),
    'home'    : ( _ )=> HomePage(),
    'pageView': ( _ )=> PageViewScreen(),
};