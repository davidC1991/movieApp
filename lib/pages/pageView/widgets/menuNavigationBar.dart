import 'package:flutter/material.dart';
import 'package:movie_app/pages/pageView/pageView_controller.dart';
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
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: yellowColor,
      unselectedItemColor: whiteColor,
      showUnselectedLabels:true ,
      selectedLabelStyle: TextStyle(color: Colors.white),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.gamepad),label: 'Generar'),
        BottomNavigationBarItem(icon: Icon(Icons.history),label: 'Historial'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'Perfil'),
        BottomNavigationBarItem(icon: Icon(Icons.delivery_dining_rounded),label: 'Domicilios')
      ],
      
    );
  }
}