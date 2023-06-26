import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../control/state_management/character_picture_provider.dart';

class CharacterCircularAvatarImageLoader extends StatelessWidget {
  const CharacterCircularAvatarImageLoader({required this.characterId,Key? key}) : super(key: key);
  final String characterId;
  @override
  Widget build(BuildContext context) {
    return Consumer<CharactersPictureProvider>(
      builder: (context, imageProvider, _)
      {
        final Uint8List? imageData =imageProvider.getImage(characterId);
        return imageData != null
            ?
        CircleAvatar(
          radius: 48,
          backgroundColor: Colors.purpleAccent,
          child: CircleAvatar(
            foregroundImage: MemoryImage(imageData),
            radius: 45,
          ),
        )

            :  loadingWidget;

      },

    );
  }
}



const Widget loadingWidget = CircleAvatar(
  radius: 48,
  backgroundColor: Colors.purpleAccent,
  child: CircleAvatar(
    foregroundImage: AssetImage('lib/assets/question_mark.jpg'),
    radius: 45,
  ),
);
