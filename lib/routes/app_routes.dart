import 'package:flutter/material.dart';
import 'package:movie_app/pages/signIn/sign_in.dart';
import 'package:movie_app/pages/welcome/welcome_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {  
    'welcome' : ( _ )=> WelcomePage(),
    'signIn'  : ( _ )=> SignInPage()
};