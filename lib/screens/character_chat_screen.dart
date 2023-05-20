import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/models/character.dart';
import '../control/state_management/characters_list_provider.dart';
import '../control/state_management/matched_characters_provider.dart';
import '../widgets/message_stream.dart';
import '../widgets/chat_options.dart';
import '../widgets/horizontal_progress_bar.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/character_circular_avatar_image_loader.dart';
import '../control/datasource/chat_datasource.dart';

const Color _backgroundColor = Color(0xFFD2D2D2);

class CharacterChatScreen extends StatelessWidget {
  const CharacterChatScreen({Key? key, required this.id}) : super(key: key);

  // static const String route = 'screens/CharacterChatScreen';
  final String id;

  @override
  Widget build(BuildContext context) {
    final Character character =
        Provider.of<MatchedCharactersProvider>(context, listen: false)
            .matchedCharacters
            .firstWhere((character) => character.id == id);
    ChatDataSource.getCurrentScene(character.id);

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: CustomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {},
                child: CharacterCircularAvatarImageLoader(
                  characterId: character.id,
                ),// TODO:check for possible improvements
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    character.bio,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: _backgroundColor,
        child: Column(
          children: [
            const HorizontalProgressBar(0.7),
            Expanded(child: Container()), //MessageStream(id)
            // ChatOptions(id),
            // MessageField(id)
          ],
        ),
      ),
    );
  }
}
