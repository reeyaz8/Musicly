import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
class CurrentList with ChangeNotifier{
 final FlutterAudioQuery audioQuery = FlutterAudioQuery();

    List<String> _playlist = [];

    List<String> get playlist => _playlist;

  
    songListEditor(currentlist, index) {
        
    }

}