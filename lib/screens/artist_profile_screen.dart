import 'package:flutter/material.dart';
import '../control/artists_list_sample.dart';
import '../widgets/small_character_card.dart';

const double _iconSize = 40;
const Color _iconColor = Colors.white70;
const TextStyle textStyle =
    TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.w700);

class ArtistProfileScreen extends StatelessWidget{
  const ArtistProfileScreen(this.id);

  final String id;

  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    final Artist artist = artistsList.firstWhere((artist) => artist.id == id);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            color: Colors.purple,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: _statusBarHeight + 10, left: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(artist.url),
                        radius: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            artist.name,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            artist.id,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.star,
                          size: _iconSize,
                          color: _iconColor,
                        ),
                        Text(
                          artist.rate.toStringAsFixed(1),
                          style: textStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.supervisor_account_sharp,
                          size: _iconSize,
                          color: _iconColor,
                        ),
                        Text(
                          artist.followers.toString(),
                          style: textStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.remove_red_eye,
                          size: _iconSize,
                          color: _iconColor,
                        ),
                        Text(
                          artist.totalView.toString(),
                          style: textStyle,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10,)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: artist.characterIdList.length,
              itemBuilder: (context, index) =>
                  SmallCharacterCard(artist.characterIdList[index]),
            ),
          )
        ],
      ),
    );
  }
}
