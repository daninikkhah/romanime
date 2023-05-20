import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/character.dart';
import '../datasource/characters_list_datasource.dart';
import 'character_picture_provider.dart';

class CharactersListProvider with ChangeNotifier {

  final List<Character> _characters = [];

  Character? get currentCharacter =>
      _characters.isNotEmpty ? _characters[0] : null;

  List<Character> get characters => [..._characters];
  
  Future<void> getNewCharacters(BuildContext context) async {
    List<Character>? newCharacters =
    await CharactersListDatasource.getCharactersList();
    notifyListeners();
    if (newCharacters != null) {
      //TODO we should probably try to get characters again ?
      _characters.addAll(newCharacters);
      newCharacters.forEach((character) async {
        Provider.of<CharactersPictureProvider>(context, listen: false)
            .downloadImage(character);
      });
    }
  }

  void dislike() {
    _characters.removeAt(0);
    notifyListeners();
  }
  
  void deleteCachedData(){
    _characters.removeWhere((element) => true);
  }
}


