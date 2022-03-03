import 'package:flutter/material.dart';
import 'package:movie_app/pages/favorites/favorites.dart';
import 'package:movie_app/pages/home/home.dart';
import 'package:movie_app/pages/pageView/pageView_controller.dart';
import 'package:movie_app/pages/pageView/widgets/menuNavigationBar_widget.dart';
import 'package:movie_app/pages/recent/recent.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/text_style.dart';
import 'package:provider/provider.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({ Key? key }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    TextStyleCustom textStyleCustom = TextStyleCustom(context);
    PageViewController pageViewController = Provider.of<PageViewController>(context, listen: false);
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Home',style:  textStyleCustom.textAppbar),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.attractions_outlined, color: greyColor, size: 30)
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

