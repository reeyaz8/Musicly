import 'dart:io';
import 'package:Musicly/screens/widgets/album_playlist.dart';
import 'package:Musicly/services/album.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final albumGetter = Provider.of<Album>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        key: PageStorageKey('song'),
        addAutomaticKeepAlives: true,
        itemCount: albumGetter.AlbumList.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () {
              albumGetter.clearAlbumPlaylist();
              albumGetter.albumPlaylist(albumGetter.AlbumList[index].id);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Lister(title:albumGetter.AlbumList[index].artist)));
            },
              child: Card(
              margin: EdgeInsets.only(bottom: 16.0, left: 15.0, right: 15.0),
              elevation: 0.0,
              child: new Container(
                height: 80.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    border: Border.all(width:1.0, color: Colors.blue)
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>[
                  Container(
                    width: 80.0,
                    margin: EdgeInsets.only(left:15.0),
                    child: albumGetter.AlbumList[index].albumArt == null ? 
                    new Icon(Icons.library_music, size: 80.0,):
                    Image.file(File(albumGetter.AlbumList[index].albumArt))
                  ),
                  
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        new Container(
                        padding: EdgeInsets.only(left: 12.0),
                      child: Text(albumGetter.AlbumList[index].artist, style: TextStyle(fontSize: 18.0),),
                  ),
                  new Container(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text('Songs: '+albumGetter.AlbumList[index].numberOfSongs),
                  )
                      ],)
                    ),
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