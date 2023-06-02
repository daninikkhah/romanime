import 'dart:collection';
import 'package:flutter/foundation.dart';
import '../models/scene_meta_data.dart';
import '../models/scene_model.dart';
import '../models/abstract_message.dart';
import '../models/player_option.dart';
import '../models/scene_element_abstract_model.dart';
import '../models/ai_scene_element.dart';
import '../models/scene_player_element.dart';
import '../models/character.dart';
import '../datasource/chat_datasource.dart';

class ChatController {
  ChatController({required this.characterId, required this.notifyListeners}) {
    fetchNewScene();
  }

  final String characterId;
  final Function notifyListeners;

  bool initiated = false;
  SceneModel? currentScene;
  SceneModel? nextScene;
  List<AbstractMessage> _messages = [];

  SceneElementAbstractModel? currentElement;
  List<PlayerOption> options = [];
  PlayerOption? selectedOption;
  Queue<AbstractMessage>? playerMessagesQueue;
  List<AbstractMessage>? aiMessagesSendingList;

  List<AbstractMessage> get messages => [...(_messages.reversed)];

  void fetchNewScene() async {
    currentScene = await ChatDataSource.getCurrentScene(characterId);
    initiateScene();
  }

  void initiateScene() {
    if(currentScene != null){
      String? id;
      SceneMetaData metadata = currentScene!.metadata;
      if (metadata.currentElementId == null) {
        // get the first element
        id = metadata.tagToIdMap[metadata.initialId] ?? '0';
      } else {
        // get saved element
        id = metadata.tagToIdMap[metadata.currentElementId] ?? '0';
      }
      updateChatStatus(currentScene!.elements[id]);
    }
  }

  void getNextElement() {
    // getting the next element
    if (currentScene != null) {
      String? id;
      SceneMetaData metadata = currentScene!.metadata;
      if (currentElement != null) {
        if (currentElement!.jumpList != null) {
          // using jumpList & checking which condition is met
          for (var jumpToElement in currentElement!.jumpList!) {
            if (jumpToElement.meetsConditions(metadata.variables)) {
              return updateChatStatus(
                  currentScene!.elements[jumpToElement.goToElement]);
            }
          }
        }
        if (currentElement!.nextElementTag != null) {
          //get next elements id
          id = metadata.tagToIdMap[currentElement!
              .nextElementTag]; // TODO figure out why this expression returns String?
          //change current element with the new one
        }
      }
      updateChatStatus(currentScene!.elements[id]);
    }
  }

  void updateChatStatus(SceneElementAbstractModel? element) {
    currentElement = element;
    if(element != null) {
      element.elementType == ElementType.player
          ? updateOptions(element as ScenePlayerElement)
          : sendAiMessage(element as AiSceneElement);
    }
    //notifyListeners(); //TODO: check if needed
  }

  updateOptions(ScenePlayerElement element) {
    options = element.options;
    notifyListeners();
  }

  sendPlayerMessage() {
    options = [];
    if (playerMessagesQueue != null && playerMessagesQueue!.isNotEmpty) {
      _messages.add(playerMessagesQueue!.first);
      playerMessagesQueue!.removeFirst();
      notifyListeners();
      if(playerMessagesQueue!.isEmpty)
        {
          getNextElement();
        }
    }
  }

  sendAiMessage(AiSceneElement element) {
    for (AbstractMessage message in element.messages) {
      Future.delayed(Duration(milliseconds: 400)); //TODO: make it dynamic
      _messages.add(message);
      notifyListeners();
    }
    getNextElement();
  }

  void selectOption(PlayerOption option) {
    selectedOption = option;
    playerMessagesQueue = Queue.from(option.messages);
    notifyListeners();
  }

  void saveCurrentElement() {}
}
