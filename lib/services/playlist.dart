import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Playlist with ChangeNotifier{

  List<PlaylistInfo> _PlaylistList = [];

  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  List<PlaylistInfo> get PlaylistList => _PlaylistList; 

  getPlaylistList() async{

    _PlaylistList = await audioQuery.getPlaylists(sortType: PlaylistSortType.DEFAULT);

    notifyListeners();

  }

}