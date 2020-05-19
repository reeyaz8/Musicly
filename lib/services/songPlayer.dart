import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
class Player with ChangeNotifier{

  final AudioPlayer audioPlayer = AudioPlayer();

  String _filePath = '';

  String _currentSongName = '';

  bool pause = true;

  bool get isPaused => pause;

  String get filePath => _filePath;

  String get currentSongName => _currentSongName;

  Duration d;

  Duration get totalTime => d;

  void getFilePath(String path){

      _filePath = path;

  }

  //  duration(){
  //   audioPlayer.onDurationChanged.listen((Duration dur) {
  //       d = dur;
        
  //       // notifyListeners();
  //   });
  // }


  void playSong(String path) {
    audioPlayer.stop();
    pause = false;
    notifyListeners();
    // duration();
    audioPlayer.play(path);
  }

  void pauseSong() {
    pause = true;
    notifyListeners();
    audioPlayer.pause();
    
  }

  void resumeSong() {
    pause = false;
    notifyListeners();
    audioPlayer.resume();
  }
}