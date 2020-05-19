import 'package:Musicly/services/playlist.dart';
import 'package:Musicly/services/songPlayer.dart';
import 'package:Musicly/services/song_state.dart';
import 'package:Musicly/services/songs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaylistDetail extends StatelessWidget {
  String title;
  int index;
  PlaylistDetail({@required this.title, this.index});
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Playlist>(context);
        final player = Provider.of<Player>(context);
    final songGetter = Provider.of<Songs>(context);
    final statusGetter = Provider.of<SongStatus>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(title, style: TextStyle(color:Colors.blue),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color:Colors.blue),
      ),

      body: ListView.builder(
        itemCount: list.detailPlaylist.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: (){
              statusGetter.setCurrentIndex(index);
              statusGetter.currentSong(list.detailPlaylist[index].displayName);
              statusGetter.changeState(list.detailPlaylist[index].id);
              player.playSong(list.detailPlaylist[index].filePath);
            },
                         child: Card(
              margin: EdgeInsets.only(bottom: 16.0, left: 15.0, right: 15.0),
              elevation: 0.0, 
              child: new Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    border: Border.all(width:1.0, color: Colors.blue)
                    ),
                child: Row(
                children:<Widget>[
                  Container(
                    margin: EdgeInsets.only(left:10.0),
                      child: Icon(Icons.music_video)
                    ),
                    Expanded(
                      child: new Container(
                      padding: EdgeInsets.all(12.0),
                      child: Text(list.detailPlaylist[index].displayName),
                  ),
                    ),
                    Container(
                          child: statusGetter.songIndex == songGetter.songList[index].id ? Container(
                          child: player.isPaused == false ? new Container(
                            child: IconButton(icon: Icon(Icons.pause_circle_filled), onPressed: () {
                              player.pauseSong();
                            })
                              ) :IconButton(icon: Icon(Icons.play_circle_filled), onPressed: () {
                              player.resumeSong();
                            }),
                        ):null,
                      )
                  ],
                ),
              )
            ),
          );
        }),

    );
  }
}