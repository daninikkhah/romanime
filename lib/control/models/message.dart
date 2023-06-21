import '../../constants.dart';
import 'dart:convert';

class Message {
  Message({required this.type, required this.sender, required this.value});

  final MessageType type;
  final MessageSender sender;
  final String value;

  factory Message.formJson(dynamic jsonString, MessageSender sender) =>
      Message(value: jsonString, sender: sender, type: MessageType.text);

  factory Message.fromLocalJsom(String jsonData){
    // ignore: unrelated_type_equality_checks
    Map<String, dynamic> decodedJson = json.decode(jsonData) ;
    MessageSender messageSender = decodedJson['sender'] == 'MessageSender.player'
        ? MessageSender.player
        : MessageSender.ai;
    MessageType messageType;
    switch (decodedJson['type']) {
      case 'MessageType.text':
        messageType = MessageType.text;
        break;
      case 'MessageType.picture':
        messageType = MessageType.picture;
        break;
      case 'MessageType.voice':
        messageType = MessageType.voice;
        break;
      default:
        messageType = MessageType.text;
    }

    return Message(type: messageType, sender: messageSender, value: decodedJson['value']?? 'null');
  }

  String toLocalJson() {

    Map<String, String> messageMap = {
      'type': type.toString(),
      'sender': sender.toString(),
      'value': value
    };

    return json.encode(messageMap);
  }

  @override
  String toString() =>
      '{ value: $value , sender: ${sender == MessageSender.player
          ? 'player'
          : 'ai'} }';
}
