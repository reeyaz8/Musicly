import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Album with ChangeNotifier{

  List<AlbumInfo> _AlbumList = [];

  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  List<AlbumInfo> get AlbumList => _AlbumList; 

  getAlbumList() async{

    _AlbumList = await audioQuery.getAlbums(sortType: AlbumSortType.DEFAULT);

    notifyListeners();

  }

}