import 'package:flutter/material.dart';
import '../control/artists_list_sample.dart';
import '../widgets/artist_card.dart';

class ArtistsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('Artists',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.white),),
        actions: [IconButton(icon: Icon(Icons.search),iconSize: 40, onPressed: (){},)],
      ),
      body: ListView.builder(
        itemCount: artistsList.length,
          itemBuilder: (context,index)=>ArtistCard(artistsList[index].id),
      ),
    );
  }
}
