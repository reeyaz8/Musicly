import 'package:Musicly/services/album.dart';
import 'package:Musicly/services/songPlayer.dart';
import 'package:Musicly/services/song_state.dart';
import 'package:Musicly/services/songs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Lister extends StatelessWidget {
  String title;
  Lister({@required this.title});
  @override
  Widget build(BuildContext context) {
    final album = Provider.of<Album>(context);
    final player = Provider.of<Player>(context);
    final statusGetter = Provider.of<SongStatus>(context);
    final songGetter = Provider.of<Songs>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(title, style: TextStyle(color: Colors.blue),)
      ),
      body: ListView.builder(
        itemCount: album.Artist_album_list.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () {
              statusGetter.currentSong(album.Artist_album_list[index].displayName);
              statusGetter.changeState(album.Artist_album_list[index].id);
              player.playSong(album.Artist_album_list[index].filePath);
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
                      child: Text(album.Artist_album_list[index].displayName),
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