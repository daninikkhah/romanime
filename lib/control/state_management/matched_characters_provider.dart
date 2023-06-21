import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../datasource/like_dislike_datasource.dart';
import 'character_picture_provider.dart';
import '../models/character.dart';
import 'character_chat_controller_provider.dart';


class MatchedCharactersProvider with ChangeNotifier{

  final List<Character> _matchedCharacters = [];

  List<Character> get matchedCharacters => _matchedCharacters;

  Future<void> fetchMatchedCharacters(BuildContext context) async{
    List<Character> matchedCharacters = await LikeDislikeDatasource.fetchLikedCharacters();
    _matchedCharacters.addAll(matchedCharacters) ;
    for (var character in matchedCharacters) {
      await Future.wait([
      Provider.of<CharacterChatControllerProvider>(context,listen: false).addNewCharacter(character.id),
      Provider.of<CharactersPictureProvider>(context,listen: false).downloadImage(character)
    ]);

    }
    // TODO: fetch the pictures
    notifyListeners();
  }



  void like({required BuildContext context,required Character character, required Function matchedPopUpAlert}) async {
    print('////////////////////////');
    print(character);
    if (character.isPlayable) {
      print('is playable: ${character.isPlayable}');
      // todo: check if character is already liked
      _matchedCharacters.add(character);
      Provider.of<CharacterChatControllerProvider>(context,listen: false).addNewCharacter(character.id);
      notifyListeners();
      matchedPopUpAlert();
    }
    LikeDislikeDatasource.like(character.id);
  }

  void deleteCachedData(){
    _matchedCharacters.removeWhere((element) => true);
  }


}