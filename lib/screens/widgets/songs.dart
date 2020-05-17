import 'package:Musicly/services/song_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Musicly/services/songs.dart';

class SongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final songGetter = Provider.of<Song>(context, listen: false);
    final statusGetter = Provider.of<SongStatus>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        key: PageStorageKey('song'),
        addAutomaticKeepAlives: true,
        itemCount: songGetter.songList.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () {
                statusGetter.changeState(index);
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
                      child: statusGetter.songIndex != null && statusGetter.songIndex == index ? new Container(
                        child: IconButton(icon: Icon(Icons.pause_circle_outline), onPressed: () {
                          print('sdksjvsbjdfn');
                        })
                          ) : null,
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