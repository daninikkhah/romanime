import '../models/scene_model.dart';
import '../models/message.dart';
import 'local_chat_datasource.dart';
import 'remote_chat_datasource.dart';
import '../models/variable.dart';


class ChatRepository{
  ChatRepository(this.characterId);
  final String characterId ;
  SceneModel? scene;
  String? currentMessageId;
  List<Message>? sentMessages ;

  void initiate() async{
    final String? sceneJsonData = await LocalChatDatasource.getSceneJsonData(characterId) ;
    final List<String>? variablesJsonData = await LocalChatDatasource.getVariables(characterId);
    List<Variable> variables = [];
    if( variablesJsonData != null) {
      for (String variableJsonData in variablesJsonData) {
      }
    }else{

    }
    await RemoteChatDataSource.getCurrentScene(characterId);
    currentMessageId = await LocalChatDatasource.getCurrentMessageId(characterId);
    sentMessages = await LocalChatDatasource.getSentMessages(characterId);
  }

}