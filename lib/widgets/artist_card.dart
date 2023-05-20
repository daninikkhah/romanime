import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/artists_list_sample.dart';
import '../control/tabs_controller.dart';
import '../screens/artist_profile_screen.dart';

const TextStyle _textStyle =TextStyle(fontSize: 18,color: Colors.purple);
const Color _iconColor= Colors.purple;
const double _iconSize =30;

class ArtistCard extends StatelessWidget {
  ArtistCard(this.id);

  final String id;

  @override
  Widget build(BuildContext context) {
    final Artist artist = artistsList.firstWhere((artist) => artist.id == id);
    return GestureDetector(
      onTap: (){
        Provider.of<TabsController>(context,listen: false).setSelectedWidget(ArtistProfileScreen(id));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(artist.url),
                    radius: 40,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      artist.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      artist.id,
                      style: TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Icon(Icons.star,color: _iconColor,size: _iconSize,),
                SizedBox(width: 5,),
                Text(artist.rate.toStringAsFixed(1),style: _textStyle,),
                Expanded(child: Container(),flex: 2,),
                Icon(Icons.people,color: _iconColor,size: _iconSize,),
                SizedBox(width: 5,),
                Text(artist.followers.toString(),style: _textStyle,),
                Expanded(child: Container(),flex: 2,),
                Icon(Icons.remove_red_eye,color: _iconColor,size: _iconSize,),
                SizedBox(width: 5,),
                Text(artist.totalView.toString(),style: _textStyle,),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
