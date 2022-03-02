import 'package:flutter/material.dart';
import 'package:movie_app/pages/pageView/pageView_controller.dart';
import 'package:movie_app/pages/signIn/sign_in_controller.dart';
import 'package:movie_app/routes/app_routes.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInController>(create: (_) => SignInController(),),
        ChangeNotifierProvider<PageViewController>(create: (_) => PageViewController(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          //primarySwatch: Colors.yellow,
          primaryColor: blackColor,
          scaffoldBackgroundColor: blackColor,
          accentColor: Colors.red,
          textTheme: TextTheme(
           
          ),
          
        ),
        routes: appRoutes,
        initialRoute: 'pageView',
      ),
    );
  }
}