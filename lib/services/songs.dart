import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Songs with ChangeNotifier{

  List<SongInfo> _songList = [];

  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  List<SongInfo> get songList => _songList; 

  getSongList() async{

    _songList = await audioQuery.getSongs(sortType: SongSortType.DEFAULT);

    notifyListeners();

  }

}