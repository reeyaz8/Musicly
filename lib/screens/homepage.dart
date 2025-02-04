import 'package:Musicly/screens/widgets/album.dart';
import 'package:Musicly/screens/widgets/favorites.dart';
import 'package:Musicly/screens/widgets/playlist.dart';
import 'package:Musicly/screens/widgets/songs.dart';
import 'package:Musicly/services/songPlayer.dart';
import 'package:Musicly/services/song_state.dart';
import 'package:Musicly/services/songs.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedIndex = 0;

   double sliderValue = 0.2;
    List<Widget> pages= [
      AlbumPage(),
      SongPage(),
      PlaylistPage(),
      FavouritesPage()
    ];

    String min='0', sec='0';

    List<String> title =[
      'Album',
      'Song',
      'Playlist',
      'Favorites'
    ];
    double height = 520;
    bool isBigContainer = true;

  @override
  Widget build(BuildContext context) {
    final songState = Provider.of<SongStatus>(context);
    final player = Provider.of<Player>(context);
    final songGetter = Provider.of<Songs>(context);
    final statusGetter = Provider.of<SongStatus>(context);

    // final songState = Provider.of<SongStatus>(context, listen: false);

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
              child: GestureDetector(
                onTap: () {
                    setState(() {
                      isBigContainer = !isBigContainer;
                      print(isBigContainer);
                    if (height==520){
                      height=0;
                    }else{
                      height= 520;
                    }
                    });
                },
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(12.0))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(child: Image.asset('images/splashscreen.jpg',
                             )),
                            SizedBox(width:10.0),
                            Container(child: Column(
                              children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top:7.0),
                                width: MediaQuery.of(context).size.width - 70.0,
                                height: 25.0,
                                child: Marquee(text: songState.currentSongName, scrollAxis: Axis.horizontal,
                                blankSpace: MediaQuery.of(context).size.width-80.0,
                                style: TextStyle(fontSize:16.0, color: Colors.white),)),
                                SizedBox(height: 8.0),
                              Container(
                                width: MediaQuery.of(context).size.width-70.0,
                                height: 30.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:<Widget>[
                                    SizedBox(width: 20.0),
                                    Container(child: IconButton(padding:EdgeInsets.all(0.0), iconSize: 30.0, onPressed: () {
                                        player.playSong(songGetter.songListMaker[songState.indexValue-1]);
                                        songState.decrementCurrentIndex();
                                        statusGetter.changeState(songGetter.songList[songState.indexValue].id);
                                        songState.changeSongName(songGetter.songList[songState.indexValue].displayName);
                                        int duration = int.parse(songGetter.songList[songState.indexValue].duration);
                                        setState(() {
                                        min =( duration/60000).round().toString();
                                        sec = ((duration/1000)%60).round().toString();
                                        });
                                    }, color: Colors.white, icon: Icon(Icons.skip_previous),)),
                                    SizedBox(width: 100.0),
                                    Container(child: Transform.rotate(angle :180 * math.pi / 180 ,child: IconButton(padding:EdgeInsets.all(0.0), color: Colors.white, iconSize: 30.0, onPressed: () {
                                        player.playSong(songGetter.songListMaker[songState.indexValue+1]);
                                        statusGetter.changeState(songGetter.songList[songState.indexValue+1].id);
                                        songState.incrementCurrentIndex();
                                        songState.changeSongName(songGetter.songList[songState.indexValue].displayName);
                                    }, icon: Icon(Icons.skip_previous),))),
                                ],
                                ),
                              )
                            ],))
                          ],
                        ),
                      ),
                      SizedBox(height: 0.0,),
                      AnimatedContainer(
                        height: height,
                        decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius:BorderRadius.only(
                          topLeft:Radius.circular(12.0),
                          topRight:Radius.circular(12.0)
                        )
                          ),
                          width: MediaQuery.of(context).size.width-5.0,
                          duration: Duration(seconds: 1),
                          child: Container(
                              alignment: Alignment.topCenter,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height:20.0),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 30.0,
                              child: Marquee(text: songState.currentSongName, scrollAxis: Axis.horizontal,
                                blankSpace: MediaQuery.of(context).size.width,
                                style: TextStyle(fontSize:16.0, color: Colors.white),)
                            ),
                            SizedBox(height:20.0),
                            Image.asset('images/splashscreen.jpg',
                                  height: 200.0,
                                  width: MediaQuery.of(context).size.width-10.0,
                            ),
                            Slider(value: sliderValue, label: '$sliderValue', onChanged: (double newValue) {
                              setState(() {
                              sliderValue = double.parse(newValue.toStringAsFixed(2));
                              });
                            }),
                            Container(
                              padding: EdgeInsets.all(0.0),
                              margin: EdgeInsets.only(left:20.0, right:20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                    Text('1:21'),
                                    Text('5:47'),
                              ],
                              )
                            ),
                            SizedBox(height: 10.0,),
                            Container(
                              width: MediaQuery.of(context).size.width - 80.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget>[
                                  new Container(
                                    child: IconButton(icon: Icon(Icons.replay), iconSize: 35.0, onPressed: (){
                                      player.playSong(songGetter.songListMaker[songState.indexValue]);
                                    },)
                                  ),
                                  new Container(child: IconButton(icon: Icon(Icons.favorite_border), iconSize: 35.0 ,onPressed: null)),
                                  new Container(
                                    child: IconButton(icon: Icon(Icons.shuffle), iconSize: 35.0 ,onPressed: () {}),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height:30.0),
                             Container(
                              width: MediaQuery.of(context).size.width - 80.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:<Widget>[
                                  new Container(
                                    child: IconButton(icon: Icon(Icons.skip_previous), iconSize: 35.0, onPressed: (){
                                       player.playSong(songGetter.songListMaker[songState.indexValue-1]);
                                        songState.decrementCurrentIndex();
                                        songState.changeSongName(songGetter.songList[songState.indexValue].displayName);
                                    },)
                                  ),
                                  new Container(
                                    child: IconButton(icon: Icon(Icons.skip_next), iconSize: 35.0 ,onPressed: () {
                                       player.playSong(songGetter.songListMaker[songState.indexValue+1]);
                                        songState.incrementCurrentIndex();
                                        songState.changeSongName(songGetter.songList[songState.indexValue].displayName);
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      )),
                    ],
                  ),
              )
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'center_btn',
          onPressed: (){},
        child: player.isPaused == true ? IconButton(icon:Icon(Icons.play_arrow), onPressed: (){
            player.resumeSong();
        },):IconButton(icon:Icon(Icons.pause), onPressed: (){
            player.pauseSong();
        },),
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
                   height = 0;
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
                   height = 0;
                    _selectedIndex = 1
                    ;
                 });
                  },
                  color: Colors.white
                  ),
                ),
                 IconButton(icon: Icon(Icons.playlist_play),
                onPressed: () {
                  setState(() {
                    height = 0;
                    _selectedIndex = 2;
                 });
                },
                color: Colors.white
                ),
                 IconButton(icon: Icon(Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    height = 0;
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