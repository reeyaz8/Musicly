import 'package:Musicly/services/playlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final songGetter = Provider.of<Playlist>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        key: PageStorageKey('song'),
        addAutomaticKeepAlives: true,
        itemCount: songGetter.PlaylistList.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () {
              print(index);
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
                      child: Text(songGetter.PlaylistList[index].name),
                  ),
                    ),
                  ],
                ),
              )
            ),
          );
        }
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'add_playlist',
          onPressed: () { 
            print('dfbdf'); 
            },
          child: Icon(Icons.playlist_add),),
    );
  }
}