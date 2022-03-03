import 'package:flutter/material.dart';
import 'package:movie_app/preferences/auth_preference.dart';
import 'package:movie_app/routes/app_routes.dart';
import 'package:movie_app/ui/global_controllers/favoritos_movie_controllers.dart';
import 'package:movie_app/ui/global_controllers/service_api_controller.dart';
import 'package:movie_app/ui/pages/details/datils_controller.dart';
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
        ChangeNotifierProvider<SignInController>(create: (_) => SignInController()),
        ChangeNotifierProvider<PageViewController>(create: (_) => PageViewController()),
        ChangeNotifierProvider<ServiceApiController>(create: (_) => ServiceApiController()),
        ChangeNotifierProvider<DetailsController>(create: (_) => DetailsController()),
        ChangeNotifierProvider<FavoritesMoviesControllers>(create: (_) => FavoritesMoviesControllers()),
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