import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'character_card.dart';
import '../control/models/character.dart';
import '../control/state_management/characters_list_provider.dart';
import '../control/state_management/like_dislike.dart';
import 'matched_popup_alert.dart';
import '../control/characters_messages_list.dart';

class DraggableCharacterCard extends StatelessWidget {
  const DraggableCharacterCard({Key? key, this.index = 0}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    double _appBarHeight = AppBar().preferredSize.height;
    double _height = MediaQuery.of(context).size.height - _appBarHeight - 8;
    var charactersProvider = Provider.of<CharactersListProvider>(context);
    final List<Character> characters = charactersProvider.characters;
    Character currentCharacter = characters[0];
    // print('////////////////');
    // print('draggable character card {$index+ 1}');
    // print('length: '+characters.length.toString());
    // print(characters[index].name);
    //TODO fix the bug:
    //this bug is happening because there are 2 card which use draggable widget
    //draggable widget needs 3 widgets for on drag,release and normal situations
    //on drag should show the below card
    // which is the character index 2
    // the question is what should I use instead of the character card when index is <= 2
    //maybe empty container ??

    void swipe(DraggableDetails draggableDetails) {
      const double minimumDrag = 125;
      if (draggableDetails.offset.dx > minimumDrag) {
        // Provider.of<CharactersMessagesList>(context,listen: false).addCharacters(characters[0].id);
        LikeDislike.like(
          context: context,
          character: currentCharacter,
          matchedPopUpAlert: () => matchedPopUpAlert(
              context: context, characterId: currentCharacter.id),
        );
      } else if (draggableDetails.offset.dx < -minimumDrag) {
        LikeDislike.dislike(context);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Draggable(
        child: CharacterCard(
          height: _height,
          character: characters[index],
        ),
        feedback: Material(
          type: MaterialType.transparency,
          child: CharacterCard(
            height: _height,
            character: characters[index],
          ),
        ),
        childWhenDragging: characters.length < 3
            ? Container()
            : CharacterCard(
                height: _height,
                character: characters[index + 1],
              ),
        onDragEnd: (draggableDetails) => swipe(draggableDetails),
      ),
    );
  }
}
