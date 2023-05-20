import 'abstract_message.dart';
import '../../constants.dart';

class TextMessage extends AbstractMessage{
  TextMessage(this.text)  : super(type: MessageType.text);
  final String text;

  @override
  String toString()=> '{ text: $text }';
}