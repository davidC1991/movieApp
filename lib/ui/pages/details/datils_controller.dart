import 'package:flutter/cupertino.dart';

class DetailsController extends ChangeNotifier{
  int _currentEpisode = 0;

  int get currentEpisode => this._currentEpisode;

  set changeEpisode(int _num) {
     this._currentEpisode = _num;
     notifyListeners();
  }
}