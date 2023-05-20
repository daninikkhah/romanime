import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/tabs_controller.dart';
import '../control/models/character.dart';
import '../screens/character_profile_screen.dart';

class CharacterInformationWidget extends StatelessWidget {
  const CharacterInformationWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        const Icon(
          Icons.star,
          color: Colors.white70,
          size: 30,
        ),
        const Text(
          '4.6',
          style: TextStyle(
              fontSize: 20, color: Colors.white70),
        ),
        const Spacer(),
        TextButton(
            onPressed: () {
              Provider.of<TabsController>(context,
                  listen: false)
                  .setSelectedWidget(
                  CharacterProfileScreen(
                      id: character.id));
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CharacterProfileScreen(id: widget.character.id)));
            },
            child: const Text('More Info',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70))),
        Expanded(child: Container()),
        const Icon(Icons.remove_red_eye_outlined,
            color: Colors.white70, size: 30),
        const Text(
          '80,000',
          style: TextStyle(
              fontSize: 20, color: Colors.white70),
        )
      ],
    );
  }
}