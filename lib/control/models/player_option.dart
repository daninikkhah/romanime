import 'abstract_message.dart';
import 'text_message.dart';
import 'var_change.dart';
import '../../constants.dart';

class PlayerOption {
  PlayerOption(
      {required this.previewText,
      required this.messages,
      required this.varChaneList});

  final String previewText;
  final List<AbstractMessage> messages;
  final List<VarChange>? varChaneList;

  factory PlayerOption.fromJson(jsonData) {

    List<dynamic>? jsonVarChangeList = jsonData['var_change'];
     final List<VarChange>? varChangeList = jsonVarChangeList?.map((jsonVarChangeData) => VarChange.fromJson(jsonVarChangeData)).toList();

    List<dynamic> jsonMessagesList = jsonData['texts'];
    List<AbstractMessage> messagesList = jsonMessagesList.map((jsonMessage) => AbstractMessage.formJson(jsonMessage,MessageSender.player)).toList();

    String firstMessageContent ='null'; //TODO change
    if(messagesList[0].type == MessageType.text){
      TextMessage firstMessage = messagesList[0] as TextMessage;
      firstMessageContent = firstMessage.text;
    }
    else if(messagesList[0].type == MessageType.picture){
      firstMessageContent = 'send a picture';
    }
    else if(messagesList[0].type == MessageType.voice){
      firstMessageContent = 'send a voice message';
    }

    return PlayerOption(
        previewText: jsonData['preview'] ?? firstMessageContent,
        messages: messagesList,
        varChaneList: varChangeList);
  }

  @override
  toString() =>
      'player option: { preview text: $previewText, messages: ${messages.toString()}, varChange: ${varChaneList.toString()}';
}
