import 'dart:convert';
import '../models/scene_model.dart';
import '../models/message.dart';
import 'local_chat_datasource.dart';
import 'remote_chat_datasource.dart';
import '../models/variable.dart';

class ChatRepository {

  static Future<SceneModel?> getCurrentScene(String characterId) async {
    //TODO: remove variables from Scene
    final String? sceneJsonData =
        await LocalChatDatasource.getSceneJsonData(characterId);

    if (sceneJsonData != null) {
      final Map<String, dynamic> decodedSceneData = json.decode(sceneJsonData);
      return SceneModel.fromJson(decodedSceneData, await getVariables(characterId));
    }

    return await RemoteChatDataSource.getCurrentScene(characterId);

  }
  // current scene is saved whenever it is fetched in the remoteDatasource

  static Future<String?> getCurrentElementId(String characterId) async =>
      await LocalChatDatasource.getCurrentElementId(characterId);

  static void setCurrentElementId(String characterId, String elementId) =>
  LocalChatDatasource.saveCurrentElementId(characterId, elementId);

  static Future<List<Message>?> getMessages(String characterId) async
  {
  List<String>? jsonMessages = await LocalChatDatasource.getSentMessages(characterId);
  return jsonMessages?.map((jsonMessage) => Message.fromLocalJsom(jsonMessage)).toList();
}

   static void saveMessages(String characterId,List<Message> messages) {
     List<String> jsonMessages = messages.map((message) => message.toLocalJson()).toList();
         LocalChatDatasource.saveSentMessages(characterId, jsonMessages);
   }

  static Future<List<Variable>?> getVariables(String characterId) async {
    final List<String>? variablesJsonData =
    await LocalChatDatasource.getVariables(characterId);
    List<Variable>? variables = [];
    if (variablesJsonData != null) {
      for (String variableJsonData in variablesJsonData) {
        variables.add(Variable.fromLocalJson(variableJsonData));
      }
    } else {
      variables = await RemoteChatDataSource.getVarList(characterId);
    }
    return variables;
  }

  static void saveVariables(String characterId, List<Variable> variables){
     List<String> jsonVariables = variables.map((variable) => variable.toLocalJson()).toList();
     LocalChatDatasource.saveVariables(characterId: characterId, jsonVariables: jsonVariables);
  }

}
