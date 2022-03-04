import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movie_app/ui/pages/pageView/pageView_controller.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:provider/provider.dart';

class MenuNavigationBar extends StatelessWidget {
  const MenuNavigationBar({ Key? key }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    PageViewController pageViewController = Provider.of<PageViewController>(context);
    return BottomNavigationBar(
      currentIndex: pageViewController.currentPage,
      onTap: (i){
        print('indes: $i');
        pageViewController.updateIndexPage = i;

        switch (i) {
          case 0:
            pageViewController.updateTitlePage = 'Home';
            break;
          case 1:
            pageViewController.updateTitlePage = 'Favorites';
            break;
          case 2:
            pageViewController.updateTitlePage = 'Recent';
            break;
          case 3:
            pageViewController.updateTitlePage = 'Search';
            break;      
        }
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: yellowColor,
      unselectedItemColor: whiteColor,
      showUnselectedLabels:true ,
      selectedLabelStyle: TextStyle(color: Colors.white),
      items: [
        BottomNavigationBarItem(icon: Icon(Ionicons.home_outline),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Ionicons.heart_outline),label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.history),label: 'Recent'),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search')
      ],
      
    );
  }
}