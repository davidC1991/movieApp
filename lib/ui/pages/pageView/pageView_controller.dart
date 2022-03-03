import 'package:flutter/cupertino.dart';

class PageViewController extends ChangeNotifier {
   PageController _pageController = PageController();
   int _currentPage = 0;
   
   PageController? get pageController => this._pageController; 
   int get currentPage => this._currentPage;

   set updateIndexPage(int value) {
     this._currentPage = value;
     _pageController.animateToPage(value, duration:Duration(milliseconds: 250) , curve: Curves.bounceIn);
     notifyListeners();
   } 
}