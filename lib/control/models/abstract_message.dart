import '../../constants.dart';
import 'text_message.dart';
class AbstractMessage{
  AbstractMessage({required this.type, required this.sender});
  final MessageType type;
  final MessageSender sender;

  factory AbstractMessage.formJson(dynamic jsonString, MessageSender sender){
    //TODO: add other message types
    return TextMessage(text: jsonString, sender: sender);
  }
}