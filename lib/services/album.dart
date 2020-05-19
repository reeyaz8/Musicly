import 'package:flutter/cupertino.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class Album with ChangeNotifier{

  List<AlbumInfo> _AlbumList = [];

 List<SongInfo> _albumPlaylist = [];

  String _album = '';

  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  List<AlbumInfo> get AlbumList => _AlbumList; 

  List<SongInfo> get Artist_album_list => _albumPlaylist;

  String get currentAlbum => _album;

  List currentSonginAlbum = [];

  List<AlbumInfo> get noOfSong => currentSonginAlbum;

  getAlbumList() async{
    _AlbumList = await audioQuery.getAlbums(sortType: AlbumSortType.DEFAULT);
    notifyListeners();

  }

  albumPlaylist(String id) async{
    _albumPlaylist = await audioQuery.getSongsFromAlbum(albumId: id);
    notifyListeners();

  }

  clearAlbumPlaylist() {
    _albumPlaylist = [];
  }
}