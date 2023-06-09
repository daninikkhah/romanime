import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../datasource/like_dislike_datasource.dart';
import 'character_picture_provider.dart';
import '../models/character.dart';
import 'character_chat_controller_provider.dart';


class MatchedCharactersProvider with ChangeNotifier{

  final List<Character> _matchedCharacters = [];

  List<Character> get matchedCharacters => _matchedCharacters;

  void fetchMatchedCharacters(BuildContext context) async{
    List<Character> matchedCharacters = await LikeDislikeDatasource.fetchLikedCharacters();
    _matchedCharacters.addAll(matchedCharacters) ;
    matchedCharacters.forEach((character) {
      Provider.of<CharactersPictureProvider>(context,listen: false).downloadImage(character);
      Provider.of<CharacterChatControllerProvider>(context,listen: false).addNewCharacter(character.id);
    });
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