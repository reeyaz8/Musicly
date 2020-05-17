import 'package:flutter/cupertino.dart';

class SongStatus with ChangeNotifier{

  int _songIndex; 

  int get songIndex => _songIndex;

  void changeState(int index) {
    
    _songIndex = index;

    notifyListeners();
  }
}