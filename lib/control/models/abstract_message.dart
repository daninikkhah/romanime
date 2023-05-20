import '../../constants.dart';
import 'text_message.dart';
class AbstractMessage{
  AbstractMessage({required this.type});
  final MessageType type;

  factory AbstractMessage.formJson(dynamic jsonString){
    //TODO: add other message types
    return TextMessage(jsonString);
  }
}