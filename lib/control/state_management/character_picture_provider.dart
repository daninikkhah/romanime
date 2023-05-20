import'package:flutter/foundation.dart';
import '../datasource/cloud_storage_datasource.dart';
import '../models/character.dart';



class CharactersPictureProvider with ChangeNotifier{
  final Map<String, Future<Uint8List?>> _charactersImages = {};
  Future<void> downloadImage(Character character) async{
    Future<Uint8List?> image =  CloudStorageDatasource.getImage(character.pictureAddress);
    _charactersImages.addAll({character.id : image});
    // print('character id: '+ character.id+ 'image address: '+ character.pictureAddress + 'added' );
    notifyListeners();
  }

  Future<Uint8List?>? getImage(String characterId) {
   return _charactersImages[characterId];
  } //TODO: check what happens if the key doesn't exist, is it even possible


}