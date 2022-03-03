import 'package:flutter/material.dart';
import 'package:movie_app/preferences/auth_preference.dart';
import 'package:movie_app/routes/app_routes.dart';
import 'package:movie_app/ui/pages/home/home_controller.dart';
import 'package:movie_app/ui/pages/pageView/pageView_controller.dart';
import 'package:movie_app/ui/pages/signIn/sign_in_controller.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new AuthPreference();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthPreference authPreference = AuthPreference();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInController>(create: (_) => SignInController(),),
        ChangeNotifierProvider<PageViewController>(create: (_) => PageViewController(),),
        ChangeNotifierProvider<HomeController>(create: (_) => HomeController(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          //primarySwatch: Colors.yellow,
          primaryColor: blackColor,
          scaffoldBackgroundColor: blackColor,
          accentColor: yellowColor,
          textTheme: TextTheme(
           
          ),
          
        ),
        routes: appRoutes,
        initialRoute: authPreference.isUserLogged?'pageView':'welcome',
      ),
    );
  }
}