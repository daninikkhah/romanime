import 'package:flutter/foundation.dart';
import '../datasource/cloud_storage_datasource.dart';
import '../models/character.dart';

class CharactersPictureProvider with ChangeNotifier {
  final Map<String, Uint8List?> _charactersImages = {};

  Future<void> downloadImage(Character character) async {
    if (!_charactersImages.containsKey(character.id)) {
      Uint8List? image =
          await CloudStorageDatasource.getImage(character.pictureAddress);
      _charactersImages.putIfAbsent(character.id, () => image);
      notifyListeners();
    }
  }

  Uint8List? getImage(String characterId) => _charactersImages[characterId];
//TODO: check what happens if the key doesn't exist, is it even possible
}

