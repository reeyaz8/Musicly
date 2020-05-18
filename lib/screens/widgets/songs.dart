import 'package:Musicly/services/songPlayer.dart';
import 'package:Musicly/services/song_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Musicly/services/songs.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
// import 'package:just_audio/just_audio.dart';


class SongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = Provider.of<Player>(context);
    final songGetter = Provider.of<Songs>(context);
    // final statusGetter = Provider.of<SongStatus>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        key: PageStorageKey('song'),
        addAutomaticKeepAlives: true,
        itemCount: songGetter.songList.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () async{
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
                    new Container(
                      child: player.isPaused == false ? new Container(
                        child: IconButton(icon: Icon(Icons.pause_circle_filled), onPressed: () {
                          player.pauseSong();
                        })
                          ) :IconButton(icon: Icon(Icons.play_circle_filled), onPressed: () {
                          player.resumeSong();
                        }),
                    )
                  ],
                ),
              )
            ),
          );
        }
        ),
    );
  }
}