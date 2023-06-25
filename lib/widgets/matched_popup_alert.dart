import 'package:flutter/material.dart';
import '../screens/character_chat_screen.dart';
import 'package:provider/provider.dart';
import '../control/state_management/character_chat_controller_provider.dart';



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
                    Provider.of<CharacterChatControllerProvider>(context,listen: false).chatControllers[characterId]?.initiateScene();
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
