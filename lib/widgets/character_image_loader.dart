import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../control/state_management/character_picture_provider.dart';

class CharacterImageLoader extends StatelessWidget {
  const CharacterImageLoader({
    Key? key,
    required this.characterId,
    required this.width,
    required double customHeight,
  }) : _customHeight = customHeight, super(key: key);

  final String characterId;
  final double width;
  final double _customHeight;

  @override
  Widget build(BuildContext context) {
    return Consumer<CharactersPictureProvider>(
      builder: (context,imageProvider,_) =>
          FutureBuilder(
            future: imageProvider.getImage(characterId),
            builder: (context,image)
            {
              if(image.connectionState == ConnectionState.done) {
                final Uint8List? imageData = image.data as Uint8List?;
                return imageData != null?
                Image.memory(
                  imageData,
                  width: width - 20,
                  height: _customHeight,
                  fit: BoxFit.cover,
                ):
                const Center(child: CircularProgressIndicator());//TODO: replace with a placeholder image

              }
              return const Center(child: CircularProgressIndicator());//TODO: replace with a placeholder image
            },
          ),

    );
  }
}