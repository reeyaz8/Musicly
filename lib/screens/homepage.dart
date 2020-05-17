import 'package:Musicly/screens/widgets/album.dart';
import 'package:Musicly/screens/widgets/favorites.dart';
import 'package:Musicly/screens/widgets/playlist.dart';
import 'package:Musicly/screens/widgets/songs.dart';
import 'package:Musicly/services/song_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedIndex = 0;
    List<Widget> pages= [
      AlbumPage(),
      SongPage(),
      PlaylistPage(),
      FavouritesPage()
    ];

    List<String> title =[
      'Album',
      'Song',
      'Playlist',
      'Favorites'
    ];

  @override
  Widget build(BuildContext context) {
    final songState = Provider.of<SongStatus>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(title[_selectedIndex], style: TextStyle(color: Colors.blueGrey, fontStyle:FontStyle.italic),)
        ),
        body: Stack(
          children: <Widget>[
            pages[_selectedIndex],   
            new Positioned(
              bottom: 2.0,
              left: 2.0,
              right: 2.0,
              child: Container(
                decoration: BoxDecoration(
                color: Colors.purple,
                  borderRadius:BorderRadius.only(
                    topLeft:Radius.circular(12.0),
                    topRight:Radius.circular(12.0)
                  )
                ),
                width: MediaQuery.of(context).size.width-5.0,
                height: 70.0,
                child: Text('fvkdlfbmldfdn'),)
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'center_btn',
          onPressed: (){},
        child: songState.songIndex == null ? Icon(Icons.play_arrow):Icon(Icons.shuffle),
        foregroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation:0.0,
          color: Colors.blue,
          shape: CircularNotchedRectangle(),
          notchMargin: 0.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             IconButton(icon: Icon(Icons.album),
                onPressed: () {
                 setState(() {
                    _selectedIndex = 0;
                 });
                },
                color: Colors.white
                ),
                Container(
                  margin: EdgeInsets.only(right:80.0),
                  child: IconButton(icon: Icon(Icons.music_note),
                  onPressed: () {
                    setState(() {
                    _selectedIndex = 1;
                 });
                  },
                  color: Colors.white
                  ),
                ),
                 IconButton(icon: Icon(Icons.playlist_play),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                 });
                },
                color: Colors.white
                ),
                 IconButton(icon: Icon(Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                 });
                },
                color: Colors.white
                ),
          ],
          )
        ),
      ),
    );
  }
}