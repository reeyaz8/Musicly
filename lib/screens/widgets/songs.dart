import 'package:Musicly/services/album.dart';
import 'package:Musicly/services/current_playing_list.dart';
import 'package:Musicly/services/songPlayer.dart';
import 'package:Musicly/services/song_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Musicly/services/songs.dart';

class SongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = Provider.of<Player>(context);
    final songGetter = Provider.of<Songs>(context);
    final statusGetter = Provider.of<SongStatus>(context);
    final nextSong = Provider.of<CurrentList>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height - 200.0,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          key: PageStorageKey('song'),
          addAutomaticKeepAlives: true,
          itemCount: songGetter.songList.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                statusGetter.setCurrentIndex(index);
                statusGetter.currentSong(songGetter.songList[index].displayName);
                statusGetter.changeState(songGetter.songList[index].id);
                player.playSong(songGetter.songList[index].filePath);
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
                        child: Text(songGetter.songList[index].displayName),
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
          }
          ),
      ),
    );
  }
}