import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/models/character.dart';
import '../control/state_management/characters_list_provider.dart';
import '../control/tabs_controller.dart';
import 'artist_profile_screen.dart';
import '../widgets/tileButton.dart';
import '../widgets/circular_icon_button.dart';
import '../widgets/character_circular_avatar_image_loader.dart';

const Color _color = Colors.purple;
const Color _secondaryColor = Colors.white70;

class CharacterProfileScreen extends StatelessWidget {
  const CharacterProfileScreen({super.key, required this.id});

  static const String route = 'screens/character_screen';
  final String id;

  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
     // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    Character character = Provider.of<CharactersListProvider>(context, listen: false)
        .characters
        .firstWhere((character) => character.id == id);
    List<Widget> _tags =[];
    character.tags.forEach((tag) => _tags.add(Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      // width: width/8,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: _secondaryColor),
      child: Text(tag,style: const TextStyle(color: Colors.purple,fontSize: 18),),
    )));
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                padding:  EdgeInsets.only(top: _statusBarHeight + 10,bottom: 15),
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100))),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CharacterCircularAvatarImageLoader(characterId: character.id),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                             Icon( //TODO should I use const??
                                Icons.star,
                                color: _secondaryColor,
                                size: 30,
                              ),
                               Text(
                                '4.6',
                                style:  TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: _secondaryColor),
                              )
                            ],
                          ),
                          Text(
                            character.name,
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Column(
                            children: const [
                              Icon(
                                Icons.remove_red_eye,
                                color: _secondaryColor,
                                size: 30,
                              ),
                              Text(
                                '80k',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: _secondaryColor),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                        //artist tag
                        onPressed: () {
                          Provider.of<TabsController>(context,listen: false).setSelectedWidget(ArtistProfileScreen(character.artistID),index: 3);
                        },
                        child: const Text(
                          '@artist_name',//TODO add the name
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: _secondaryColor),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            side: MaterialStateProperty.all<BorderSide>(
                               const  BorderSide(color: _secondaryColor))),
                      ),
                      Text(
                        character.bio,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40,5,40,5),
                        child: Text(
                          character.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.w500,
                              color: _secondaryColor),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 40),
                        child: Wrap(children: _tags,),//TODO test it
                      )//TODO /////////////////////////////////////////////////////////////////////
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      CircularIconButton(onTap: (){},icon: Icons.report_problem,),
                      const SizedBox(width: 20,),
                      CircularIconButton(onTap: (){},icon: Icons.star,),
                      const SizedBox(width: 20,),
                      CircularIconButton(onTap: (){},icon: Icons.add_ic_call,),

                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                TileButton(onTap: (){},title: 'Manage Preferences',icon: Icons.tune,),
                TileButton(onTap: (){},title: 'Manage Preferences',icon: Icons.add_ic_call,),
              ],
            ),
          ),
          // Expanded(child: Container())
        ],
      ),
    );
  }
}



