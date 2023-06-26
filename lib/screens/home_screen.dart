import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/draggable_character_card.dart';
import 'package:provider/provider.dart';
import '../control/state_management/characters_list_provider.dart';
import '../widgets/like_dislike_button.dart';
import '../control/state_management/character_picture_provider.dart';
import '../widgets/character_card.dart';
import '../control/models/character.dart';
import '../control/state_management/characters_list_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final double _appBarHeight = AppBar().preferredSize.height;
    final double _characterHeight = height - _appBarHeight - 8;
    // final List<Character> _characters =
    //     Provider.of<CharactersList>(context, listen: false).characters;

    // var characters = Provider.of<CharactersList>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Theme.of(context).backgroundColor,
      // backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   foregroundColor: Colors.transparent,
      //   shadowColor:  Colors.transparent,
      //   // chat
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.account_circle,
      //       size: 30,
      //       // color: Colors.black,
      //     ),
      //     onPressed: () {},
      //   ),
      //   title: Center(
      //       child: Icon(
      //     Icons.whatshot,
      //     // color: Colors.red,
      //     size: 30,
      //   )),
      //   actions: [
      //     IconButton(
      //         icon: Icon(
      //           Icons.chat,
      //           size: 30,
      //           // color: Colors.black,
      //         ),
      //         onPressed: () {
      //           Navigator.of(context).pushNamed(ChatsScreen.route);
      //         }),
      //   ],
      // ),
      body: Stack(
        children: [
          Consumer<CharactersListProvider>(
            builder: (context, charactersList, _) {
              final List<Character> characters = charactersList.characters;
              if (characters.isEmpty) {
                return Container(
                  child: Text('hi'),
                  color: Colors.amberAccent,
                );
                //TODO: implement the placeholder page
              } else {
                return Consumer<CharactersPictureProvider>(
                  builder: (context, pictureProvider,_) {
                    Uint8List? image =  pictureProvider.getImage(characters[0].id);
                    if (image != null) {
                      return Image.memory(
                       image as Uint8List,
                        height: height,
                        width: width,
                        fit: BoxFit.cover,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());

                  }
                );
              }
            },
          ),
          Container(
            color: Colors.white.withOpacity(0.1),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),



          ////////////////////////////////



          SafeArea(
            child:
                Consumer<CharactersListProvider>(
                  builder: (context, charactersList, _) =>
                  charactersList.characters.isEmpty
                      ? const Center(child: Text('no more characters!'))
                      :
                      Column(
                    children:  [
                      const Padding(
                        padding:  EdgeInsets.symmetric(vertical: 0),// TODO: had overflow with padding 5 fix : make sure it works dynamic
                        child: DraggableCharacterCard(),
                        // Center(
                        //   child: Stack(
                        //     children: [
                        //       if (charactersList.characters.length > 1)
                        //         const DraggableCharacterCard(
                        //           index: 1,
                        //         ), //TODO
                        //         // Consumer<CharactersList>(
                        //         //     builder: (context, charactersList, _) =>
                        //         //         Padding(
                        //         //           padding:
                        //         //           const EdgeInsets.all(8.0),
                        //         //           child: CharacterCard(
                        //         //               character: charactersList
                        //         //                   .characters[1],
                        //         //               height: _characterHeight),
                        //         //         )),
                        //       const Positioned(
                        //         child: DraggableCharacterCard(),
                        //         bottom: 5,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ),
                       LikeDislikeButton(character: charactersList.characters[0]),
                    ],
                  ),
                ),



          ),
        ],
      ),
    );
  }
}
