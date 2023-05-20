import 'abstract_message.dart';
import 'var_change.dart';

class PlayerOption {
  PlayerOption(
      {required this.previewText,
      required this.messages,
      required this.varChaneList});

  final String? previewText;
  final List<AbstractMessage> messages;
  final List<VarChange>? varChaneList;

  factory PlayerOption.fromJson(jsonData) {

    List<dynamic>? jsonVarChangeList = jsonData['var_change'];
     final List<VarChange>? varChangeList = jsonVarChangeList == null? null : jsonVarChangeList.map((jsonVarChangeData) => VarChange.fromJson(jsonVarChangeData)).toList();

    List<dynamic> jsonMessagesList = jsonData['texts'];
    List<AbstractMessage> messagesList = jsonMessagesList.map((jsonMessage) => AbstractMessage.formJson(jsonMessage)).toList();

    return PlayerOption(
        previewText: jsonData['preview'],
        messages: messagesList,
        varChaneList: varChangeList);
  }

  @override
  toString() =>
      'player option: { preview text: $previewText, messages: ${messages.toString()}, varChange: ${varChaneList.toString()}';
}
