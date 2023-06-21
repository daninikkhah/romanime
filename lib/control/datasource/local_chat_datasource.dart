import 'dart:convert';
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

  static void saveVariables( {required String characterId,required List<String> jsonVariables})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('variables$characterId', jsonVariables);
  }
  static Future<List<String>?> getVariables(String characterId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('variables$characterId');
  }


  static void saveCurrentElementId(String characterId, String elementId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentElementId$characterId', elementId);
  }
  static Future<String?> getCurrentElementId(String characterId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentElementId$characterId');
  }
  static void saveSentMessages(String characterId, List<String> jsonMessages)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('savedMessages$characterId', jsonMessages);
  }
  static Future< List<String>?> getSavedJsonMessages(String characterId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('savedMessages$characterId',);
  }

  static Future<List<String>?> getSentMessages(String characterId)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('savedMessages$characterId');
  }
}