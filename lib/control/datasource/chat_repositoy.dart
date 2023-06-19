import 'dart:convert';
import '../models/scene_model.dart';
import '../models/message.dart';
import 'local_chat_datasource.dart';
import 'remote_chat_datasource.dart';
import '../models/variable.dart';

class ChatRepository {

  static Future<SceneModel?> getCurrentScene(String characterId) async {
    print('................. chat repository .......................');
    //TODO: remove variables from Scene
    final String? sceneJsonData =
        await LocalChatDatasource.getSceneJsonData(characterId);


    if (sceneJsonData != null) {
      final Map<String, dynamic> decodedSceneData = json.decode(sceneJsonData);
      return SceneModel.fromJson(decodedSceneData, await ChatRepository.getVariables(characterId));
    }

    return await RemoteChatDataSource.getCurrentScene(characterId);

  }

  static Future<String?>  getCurrentMessageId(String characterId) async =>
      await LocalChatDatasource.getCurrentMessageId(characterId);

  static Future<List<Message>?> getMessages(String characterId) async =>
      await LocalChatDatasource.getSentMessages(characterId);

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

}
