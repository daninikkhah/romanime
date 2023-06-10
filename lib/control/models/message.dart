import '../../constants.dart';
class Message{
  Message({required this.type, required this.sender, required this.value});
  final MessageType type;
  final MessageSender sender;
  final String value;

  factory Message.formJson(dynamic jsonString, MessageSender sender){

    //TODO: add other message types
    return Message(value: jsonString, sender: sender,type: MessageType.text);
  }

  String toString()=> '{ value: $value , sender: ${sender == MessageSender.player? 'player' : 'ai'} }';
}