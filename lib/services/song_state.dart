import 'package:flutter/cupertino.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

class SongStatus with ChangeNotifier{

  int _songIndex; 

  int get songIndex => _songIndex;

  void changeState(int index) {
    
    _songIndex = index;

    notifyListeners();
  }
}