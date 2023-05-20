import 'package:flutter/foundation.dart';
import 'message.dart';
import 'BobsFile.dart';

class CharacterMessages with ChangeNotifier {
  CharacterMessages({required this.id, required this.talksList}) {
    // Talk _talk = Bobs.next(0);
    // for (var message in _talk.conversations) {
    //   Future.delayed(const Duration(seconds: 1));
    //   _oldMessages.add(Message(message: message,bIsMine: false));
    // }
  }

  final String id;
  final List<Talk> talksList;
  final List<Message> _oldMessages = [];

  //Message(message: 'fsks',bIsMine: true),Message(message: 'fsks',bIsMine: true),Message(message: 'fsks',bIsMine: false),Message(message: 'aaaaaa',bIsMine: true)
  void add(Message message) {
    _oldMessages.insert(0, message);
    // _messages.add(message);
    notifyListeners();
  }

  Talk nextTalk(int nextTalkId) => talksList[nextTalkId];

  List<Message> get messages => [..._oldMessages];
}
