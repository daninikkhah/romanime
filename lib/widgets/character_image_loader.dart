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
      builder: (context,imageProvider,_) 
          {
                final Uint8List? imageData = imageProvider.getImage(characterId);
                return imageData != null?
                Image.memory(
                  imageData,
                  width: width - 20,
                  height: _customHeight,
                  fit: BoxFit.cover,
                ):
                const Center(child: CircularProgressIndicator());//TODO: replace with a placeholder image

    
            },
          

    );
  }
}