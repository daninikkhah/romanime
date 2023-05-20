import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/message.dart';
import '../control/models/character.dart';
import '../widgets/bar_indicator.dart';
import '../screens/character_chat_screen.dart';
import '../control/characters_messages_list.dart';
import 'character_circular_avatar_image_loader.dart';
import '../control/state_management/matched_characters_provider.dart';

class ContactCard extends StatelessWidget {
  const ContactCard(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final List<Message> _messages =
        Provider.of<CharactersMessagesList>(context, listen: false)
            .getMessages(index);
    return Consumer<MatchedCharactersProvider>(builder: (context, characters, _) {
      final double _width = MediaQuery.of(context).size.width;
      Character character = characters.matchedCharacters[index];

      return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CharacterChatScreen(
                      id: character.id,
                    ))),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SizedBox(
                  width: _width - 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CharacterCircularAvatarImageLoader(
                                characterId: character.id),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: SizedBox(
                              width: _width - 210,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    character.name,
                                    softWrap: true,
                                    style: const TextStyle(fontSize: 36),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    character.bio,
                                    softWrap: true,
                                    // overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'no message yet',
                          //TODO FIX IT!
                          // _messages.isEmpty?
                          // 'no message yet': _messages.first.message,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                // const Spacer(),
                // const BarIndicator()
              ],
            ),
          ),
        ),
      );
    });
  }
}
