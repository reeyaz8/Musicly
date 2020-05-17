import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: ListView.builder(
        key: PageStorageKey('favorite'),
        itemCount: 30,
        itemBuilder: (context, int index) {
        return Card(
          child: Text(index.toString())
        );
      })
    );
  }
}