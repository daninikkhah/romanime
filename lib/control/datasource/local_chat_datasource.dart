import 'dart:convert';
import 'dart:html';

import '../models/scene_model.dart';
import '../models/message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalChatDatasource{
  SceneModel? scene;
  String? currentMessageId;
  List<Message> sentMessages = [];

  static void saveScene(String characterId, String sceneJson)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('sceneJsonData$characterId', sceneJson);
  }
  static Future<String?> getSceneJsonData(String characterId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('sceneJsonData$characterId');
  }

  static void saveVariables(String characterId, String sceneJson)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();


  }
  static Future<List<String>?> getVariables(String characterId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

  }


  static void saveCurrentMessageId(String characterId, String currentMessageId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentMessageId$characterId', currentMessageId);
  }
  static Future<String?> getCurrentMessageId(String characterId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

  }
  static void saveSentMessages(String characterId, List<String> jsonMessages)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(characterId, jsonMessages);
  }
  static void addMessage(String characterId)async{}
  static Future<List<Message>?> getSentMessages(String characterId)async{}
}