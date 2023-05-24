import 'abstract_message.dart';
import '../../constants.dart';

class TextMessage extends AbstractMessage{
  TextMessage({required this.text, required super.sender}) : super(type: MessageType.text);
  final String text;

  @override
  String toString()=> '{ text: $text , sender: ${sender == MessageSender.player? 'player' : 'ai'} }';
}