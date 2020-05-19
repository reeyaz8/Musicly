import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Songs with ChangeNotifier{

  List<SongInfo> _songList = [];

  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  List<String> _playingList = [];

  List<SongInfo> get songList => _songList; 

  List<String> get listSong => _playingList; 

  List<String> _songListMaker =[];

  List<String> get songListMaker => _songListMaker;

  getSongList() async{
    _songList = await audioQuery.getSongs(sortType: SongSortType.DEFAULT);
    notifyListeners();
    for (var item in songList) {
      _songListMaker.add(item.filePath);
    }
  }
}