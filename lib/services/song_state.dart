import 'package:flutter/cupertino.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'songs.dart';
class SongStatus with ChangeNotifier{

  String _songIndex; 

  String get songIndex => _songIndex;
  String get currentSongName => _currentSongName;
  String _currentSongName = '';

  int _currentIndex = 0;
  int get indexValue => _currentIndex;

  Duration time;
  
  void changeState(String index) {
    
    _songIndex = index;
    notifyListeners();
  }

  void currentSong(String name) {
      _currentSongName = name;
      notifyListeners();
  }

  void changeSongName(String name) {
      _currentSongName = name;
      print(_currentSongName);
      notifyListeners();
  }

  void setCurrentIndex(int index){
    _currentIndex = index;


  }

  void incrementCurrentIndex() {
    _currentIndex++;
  }

  void decrementCurrentIndex() {
    _currentIndex--;
  }
}