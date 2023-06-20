import 'dart:collection';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:romanime/control/models/var_change.dart';
import 'package:romanime/control/models/variable.dart';
import '../models/scene_meta_data.dart';
import '../models/scene_model.dart';
import '../models/message.dart';
import '../models/player_option.dart';
import '../models/scene_element_abstract_model.dart';
import '../models/ai_scene_element.dart';
import '../models/scene_player_element.dart';
import '../datasource/remote_chat_datasource.dart';
import '../datasource/chat_repository.dart';

class ChatController {
  ChatController({required this.characterId, required this.notifyListeners}) {
    fetchNewScene();
  }

  final String characterId;
  final Function notifyListeners;
  final GlobalKey<AnimatedListState> animatedListKey =
  GlobalKey<AnimatedListState>();

  bool initiated = false;
  SceneModel? currentScene;
  SceneModel? nextScene;
  List<Message> _messages = [];

  SceneElementAbstractModel? currentElement;
  List<PlayerOption> options = [];
  PlayerOption? selectedOption;
  Queue<Message>? playerMessagesQueue;
  List<Message>? aiMessagesSendingList;
  bool isVarChangeApplied = false;
  List<Variable> varList =[];

  List<Message> get messages => [...(_messages.reversed)];

  void fetchNewScene() async {
    currentScene = await ChatRepository.getCurrentScene(characterId);
  }

  void initiateScene() {
    //must be called when initializing the chat
    // probably in the characterChatScreen or it's children, like chatStream
   if(!initiated) {
      if (currentScene != null) {
        String? id;
        SceneMetaData metadata = currentScene!.metadata;
        varList = metadata.variables;
        if (metadata.currentElementId == null) {
          // get the first element
          id = metadata.tagToIdMap[metadata.initialId] ?? '0';
        } else {
          // get saved element
          id = metadata.tagToIdMap[metadata.currentElementId] ?? '0';
        }
        updateChatStatus(currentScene!.elements[id]);
      }
      initiated = true;
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
            if (jumpToElement.meetsConditions(varList)) {
              id = jumpToElement.goToElement;
              return updateChatStatus(
                  currentScene!.elements[id]);
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
    isVarChangeApplied = false;
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
    if(!isVarChangeApplied) applyVarChange(selectedOption?.varChaneList);
      options = [];
    if (playerMessagesQueue != null && playerMessagesQueue!.isNotEmpty) {
      _addMessage(playerMessagesQueue!.first);
      playerMessagesQueue!.removeFirst();
      notifyListeners();
      if(playerMessagesQueue!.isEmpty)
        {
          getNextElement();
        }
    }
  }

  sendAiMessage(AiSceneElement element) async {
    bool isFirstMessage = true;
    for (Message message in element.messages) {
      await Future.delayed(Duration(milliseconds: isFirstMessage? 1200 :1800)); //TODO: make it dynamic
     _addMessage(message);
      isFirstMessage = false;
      notifyListeners();
    }
    await Future.delayed(const Duration(milliseconds: 1200));
    getNextElement();
  }

  void selectOption(PlayerOption option) {
    selectedOption = option;
    playerMessagesQueue = Queue.from(option.messages);
    notifyListeners();
  }

  void applyVarChange(List<VarChange>? varChangeList){
    if(varChangeList != null){
      for (var varChange in varChangeList) {
        Variable variable = varList
            .firstWhere((variable) => variable.name == varChange.variableName);
        variable.applyVarChange(varChange);
      }
      isVarChangeApplied = true;
    }
  }

  void _addMessage(Message message){
    _messages.add(message);
    animatedListKey.currentState?.insertItem(0,duration:const Duration(milliseconds: 400) );
  }

  void saveCurrentElement() {}
}
