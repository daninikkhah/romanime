import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:romanime/constants.dart';
import '../control/state_management/chat_controller.dart';
import '../control/models/message.dart';
import '../control/models/message.dart';

const double _radius = 20;
const Color _primaryColor = Color(0xFFA129FF);
const Color _primaryTextColor = _primaryColor;

class ChatOptionsTextField extends StatelessWidget {
  ChatOptionsTextField(
      {Key? key,
      required this.chatController,
      required this.changeOptionsVisibilityState})
      : super(key: key);
  final ChatController chatController;
  final Function changeOptionsVisibilityState;

  String getSelectedMessage() {
    Message? selectedMessage = chatController.playerMessagesQueue?.firstOrNull;
    if (selectedMessage != null) {
      if (selectedMessage.type == MessageType.text) {
        Message selectedTextMessage = selectedMessage as Message;
        return selectedTextMessage.value ?? '';
      } //TODO: implement other message Types
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    String selectedMessage = getSelectedMessage();
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_radius))),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(5))),
          onPressed: chatController.options.isEmpty
              ? null
              : () => changeOptionsVisibilityState(),
          //TODO: check if it works **********

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
                  icon: Icon(Icons.send,
                      size: 30,
                      color: chatController.playerMessagesQueue != null &&
                              chatController.playerMessagesQueue!.isNotEmpty
                          ? _primaryColor
                          : Colors.grey),
                  iconSize: 30,
                  onPressed: chatController.playerMessagesQueue != null &&
                          chatController.playerMessagesQueue!.isNotEmpty
                      ? chatController.sendPlayerMessage
                      : null) //
            ],
          )),
    );
  }
}
