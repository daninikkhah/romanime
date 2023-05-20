import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/state_management/characters_list_provider.dart';
import '../control/models/character.dart';
import '../control/tabs_controller.dart';
import '../screens/character_profile_screen.dart';

class SmallCharacterCard extends StatelessWidget {
  SmallCharacterCard(this.id);

  final String id;

  @override
  Widget build(BuildContext context) {
    final Character _character = Provider.of<CharactersListProvider>(context).characters.firstWhere((character) => character.id ==id);
    List<Widget> _tags =[];
    _character.tags.forEach((tag) => _tags.add(Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      // width: width/8,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.purple),
      child: Text(tag,style: TextStyle(color: Colors.white,fontSize: 18),),
    )));

    return GestureDetector(
      onTap: (){
        Provider.of<TabsController>(context,listen: false).setSelectedWidget(CharacterProfileScreen(id:id));
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
                    backgroundImage: NetworkImage(_character.pictureAddress),
                    radius: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _character.name,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      _character.bio,
                      style: TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: _tags
            )
          ],
        ),
      ),
    );
  }
}

