import '../../constants.dart';

class Message {
  Message({required this.type, required this.sender, required this.value});

  final MessageType type;
  final MessageSender sender;
  final String value;

  factory Message.formJson(dynamic jsonString, MessageSender sender) =>
      Message(value: jsonString, sender: sender, type: MessageType.text);

  factory Message.fromLocalMap(Map<String, String> localMapData){
    // ignore: unrelated_type_equality_checks
    MessageSender messageSender = localMapData['sender'] == MessageSender.player
        ? MessageSender.player
        : MessageSender.ai;
    MessageType messageType;
    switch (localMapData['type']) {
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

    return Message(type: messageType, sender: messageSender, value: localMapData['value']?? 'null');
  }

  Map<String, String> toMap() =>
      {'type': type.toString(), 'sender': sender.toString(), 'value': value};

  @override
  String toString() =>
      '{ value: $value , sender: ${sender == MessageSender.player
          ? 'player'
          : 'ai'} }';
}
