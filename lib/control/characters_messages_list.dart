import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'character_messages.dart';
import 'message.dart';
import 'BobsFile.dart';
import '../constants.dart';
import '../sample_data.dart';

class CharactersMessagesList with ChangeNotifier {
  // CharactersMessagesList(){
  //
  // }
  final List<CharacterMessages> _characters = [
    CharacterMessages(id: '0',talksList:flirting),
    CharacterMessages(id: '4',talksList:flirting),
    CharacterMessages(id: '7',talksList:flirting),
    CharacterMessages(id: '12',talksList:bobsTalks),
    CharacterMessages(id: '10',talksList:textGameTalks),
    CharacterMessages(id: '11',talksList:flirting),


  ];

  bool _isAiCharacterTyping = false;

  Duration _delayBeforeResponse = const Duration(seconds: 1);

  bool get isAiCharacterTyping => _isAiCharacterTyping;

  set isAiCharacterTyping(bool isTyping) =>
      _isAiCharacterTyping = isTyping;

  Duration get delayBeforeResponse => _delayBeforeResponse;

  void setDelayBeforeResponse(Duration duration) =>
      _delayBeforeResponse = duration;

  // void addCharacters(String id) {
  //   _characters.add(CharacterMessages(id: id));
  //   notifyListeners();
  // }

  // void _addCharacter(CharacterMessages character){
  //   _characters.add(character);
  // }
  // CharacterMessages  getCharacter(String id) {
  //   CharacterMessages character =_characters.firstWhere((character) => character.id == id);
  //   if(character ==null) {
  //     character =CharacterMessages(id: id);
  //     _characters.add(character);
  //     notifyListeners();
  //   }
  //   return character;
  // }
  int getCharacterIndex(String id) =>
      _characters.indexWhere((character) => character.id == id);

  void addMessage(Message message, String id) {
    _characters.firstWhere((character) => character.id == id).add(message);
    notifyListeners();
  }

  CharacterMessages getCharacterMessages(String id)=> _characters.firstWhere((character) => character.id == id);

  List<Message> getMessages(int index) => _characters[index].messages;
}
final List<Talk> _test =[
  Talk(0, [Conversation(MessageType.picture, 'lib/assets/clara.jpg')], [Option(['hi'], 1)]),
  Talk(1, [Conversation(MessageType.picture, 'lib/assets/clara.jpg')], [Option(['next'], 2)]),
  Talk(2, [Conversation(MessageType.picture, 'lib/assets/clara.jpg')], [Option(['next'], 3)]),
  Talk(3, [Conversation(MessageType.picture, 'lib/assets/clara.jpg')], [Option(['next'], 4)]),
  Talk(4, [Conversation(MessageType.picture, 'lib/assets/clara.jpg')], [Option(['next'], 5)]),
  Talk(5, [Conversation(MessageType.picture, 'lib/assets/clara.jpg')], [Option(['next'], 0)]),

];


