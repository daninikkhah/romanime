import '../constants.dart';

class Message{
  Message({required this.message,this.bIsMine = true, this.type = MessageType.text});
  final MessageType type;
  final bool bIsMine;
  final String message;
}