import 'package:flutter/material.dart';
import '../screens/character_chat_screen.dart';



   Future<Object> matchedPopUpAlert(
    {required BuildContext context,required String characterId}) async{
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('It\'s a match matched!'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('continue browsing')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CharacterChatScreen(id: characterId)));
                  },
                  // () => Navigator.of(context)
                  // .popAndPushNamed(ChatsScreen.route),//goes to chats screen
                  child: const Text('go to chats')),
            ],
          ));
}
