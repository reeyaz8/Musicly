import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
class Player with ChangeNotifier{

  final AudioPlayer audioPlayer = AudioPlayer();

  String _filePath = '';

  bool pause = true;

  bool get isPaused => pause;

  String get filePath => _filePath;

  void getFilePath(String path){

      _filePath = path;

  }

  void playSong(String path) {
    audioPlayer.stop();
    audioPlayer.play(path);
    // audioPlayer.m
  }

  void pauseSong() {
    pause = true;
    audioPlayer.pause();
    notifyListeners();
  }

  void resumeSong() {
    pause = false;
    audioPlayer.resume();
    notifyListeners();
  }
  
}