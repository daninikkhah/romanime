import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../control/state_management/character_picture_provider.dart';

class CharacterCircularAvatarImageLoader extends StatelessWidget {
  const CharacterCircularAvatarImageLoader({
    Key? key,
    required this.characterId,
  })  :super(key: key);

  final String characterId;


  @override
  Widget build(BuildContext context) {
    return Consumer<CharactersPictureProvider>(
      builder: (context, imageProvider, _) => FutureBuilder(
        future: imageProvider.getImage(characterId),
        builder: (context, image) {
          if (image.connectionState == ConnectionState.done) {
            final Uint8List? imageData = image.data as Uint8List?;
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
          }
          return loadingWidget;
        },
      ),
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
