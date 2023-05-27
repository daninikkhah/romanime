import 'package:flutter/foundation.dart';
import '../models/scene_model.dart';
import '../models/abstract_message.dart';
import '../models/player_option.dart';
import '../models/scene_element_abstract_model.dart';


class ChatController with ChangeNotifier{

  SceneModel? currentScene;
  SceneModel? nextScene;
  List<AbstractMessage> messages = [];

  SceneElementAbstractModel? currentElement;
  List<PlayerOption> options = [];
  PlayerOption? selectedOption;
  List<AbstractMessage>? messagesSendingList;


  fetchNewScene(){

  }

  nextElement(){

  }

  sendPlayerMessage(){

  }

  sendAiMessage(){

  }

  void selectOption(PlayerOption selectedOption){

  }



}