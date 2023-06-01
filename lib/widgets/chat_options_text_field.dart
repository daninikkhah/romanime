import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:romanime/constants.dart';
import '../control/state_management/chat_controller.dart';
import '../control/models/text_message.dart';
import '../control/models/abstract_message.dart';


const double _radius = 20;
const Color _primaryColor = Color(0xFFA129FF);
const Color _primaryTextColor = _primaryColor;

class ChatOptionsTextField extends StatelessWidget {
   ChatOptionsTextField({Key? key, required this.chatController, required this.changeOptionsVisibilityState}) : super(key: key);
  final ChatController chatController;
  final  Function changeOptionsVisibilityState;

  String getSelectedMessage(){
    AbstractMessage? selectedMessage = chatController.playerMessagesQueue?.first;
    if(selectedMessage != null) {
      if (selectedMessage.type == MessageType.text) {
        TextMessage selectedTextMessage = selectedMessage as TextMessage;
        return selectedTextMessage.text?? '';
      } //TODO: implement other message Types
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    String selectedMessage=  getSelectedMessage();
    return Padding(
      padding:
      const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_radius))),
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.white),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(5))),
          onPressed: chatController.options.isEmpty
              ? null
              :()=> changeOptionsVisibilityState(), //TODO: check if it works **********

          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 20, left: 10),
                child: Icon(Icons.add_circle_outline,
                    size: 30, color: _primaryColor),
              ),
              Expanded(
                child: selectedMessage == ''
                    ? const Text('select a message',
                    style: TextStyle(
                        fontSize: 22,
                        color: _primaryTextColor,
                        fontWeight: FontWeight.w700))
                    : AnimatedTextKit(
                  key: ValueKey<String>(selectedMessage),
                  animatedTexts: [
                    TyperAnimatedText(selectedMessage,
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: _primaryTextColor,
                            fontWeight: FontWeight.w700),
                        speed: const Duration(milliseconds: 80))
                  ],
                  isRepeatingAnimation: false,
                  displayFullTextOnTap: true, //TODO ask the ux team
                ),
              ),
              // send icon
              IconButton(
                  icon: const Icon(Icons.send,
                      size: 30, color: _primaryColor),
                  iconSize: 30,
                  onPressed: () async {})
            ],
          )),
    );
  }
}
