import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Playlist with ChangeNotifier{

  List<PlaylistInfo> _PlaylistList = [];

  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  List<PlaylistInfo> get PlaylistList => _PlaylistList; 

  List<SongInfo> _detailPlaylist = [];

  List<SongInfo> get detailPlaylist => _detailPlaylist;

  getPlaylistList() async{

    _PlaylistList = await audioQuery.getPlaylists(sortType: PlaylistSortType.DEFAULT);

    notifyListeners();

  }

  getdetailplaylist(int index) async{
      _detailPlaylist = await audioQuery.getSongsFromPlaylist(playlist: this._PlaylistList[index]);
      notifyListeners();

  }

}