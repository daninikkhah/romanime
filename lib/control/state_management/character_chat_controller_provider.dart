import 'package:flutter/foundation.dart';

import 'chat_controller.dart';

class CharacterChatControllerProvider with ChangeNotifier{

  final Map<String,ChatController> chatControllers = {};

  void addNewCharacter(String characterId){

    chatControllers.putIfAbsent(characterId, () => ChatController(characterId: characterId, notifyListeners: notifyListeners));
    notifyListeners();
  }

}