import 'package:flutter/foundation.dart';

import 'chat_controller.dart';

class CharacterChatControllerProvider with ChangeNotifier{

  final Map<String,ChatController> chatControllers = {};

  Future<void> addNewCharacter(String characterId) async{
    ChatController chatController = ChatController(characterId: characterId, notifyListeners: notifyListeners);
    chatControllers.putIfAbsent(characterId, () => chatController);
    await chatController.fetchNewScene();
    notifyListeners();
  }

}