import 'dart:async';
import 'package:Musicly/screens/homepage.dart';
import 'package:Musicly/services/album.dart';
import 'package:Musicly/services/playlist.dart';
import 'package:Musicly/services/song_state.dart';
import 'package:Musicly/services/songs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
         providers: [
          ChangeNotifierProvider<Song>(create: (_) => Song()),
          ChangeNotifierProvider<Album>(create: (_) => Album()),
          ChangeNotifierProvider<Playlist>(create: (_) => Playlist()),
          ChangeNotifierProvider<SongStatus>(create: (_) => SongStatus())
         ],
            child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(),
        ),
      );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final songGetter = Provider.of<Song>(context, listen: false);
    final albumGetter = Provider.of<Album>(context, listen: false);
    final playlistGetter = Provider.of<Playlist>(context, listen: false);
    songGetter.getSongList();
    albumGetter.getAlbumList();
    playlistGetter.getPlaylistList();
    Timer(Duration(seconds: 3), () {
        Navigator.of(context).push(_createRoute());
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child:Container(
      margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage('images/splashscreen.jpg'),
      fit: BoxFit.cover,
        ),
      ),
      child: null
    )
      ),


    
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}