import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../control/state_management/chat_controller.dart';
import '../control/state_management/character_chat_controller_provider.dart';
import 'bubble_chat_option.dart';
import '../control/models/player_option.dart';
import 'chat_options_text_field.dart';


const double _radius = 20;
const Color _primaryColor = Color(0xFFA129FF);
const Color _darkPrimaryColor = Color(0xFFBF98FF);
const Color _primaryTextColor = _primaryColor;

class ChatOptions extends StatefulWidget {
  const ChatOptions(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  _ChatOptionsState createState() => _ChatOptionsState();
}

class _ChatOptionsState extends State<ChatOptions> {
  // bool _optionsVisibility = true;
  bool showOptions = true;

  void changeOptionsVisibilityState() {
    setState(() {
      showOptions = !showOptions;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterChatControllerProvider>(builder:
    (context,chatControllerProvider,_){
      ChatController chatController = chatControllerProvider.chatControllers[widget.id]! ; //TODO: handle error null case
      List<PlayerOption> options = chatController.options;

      return AnimatedSize(
        duration: Duration(milliseconds: options.length < 4
            ? 200 + options.length * 50
            : 400),

        child: Container(
          decoration: options.isNotEmpty && showOptions
              ? const BoxDecoration(
              color: _darkPrimaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_radius),
                  topLeft: Radius.circular(_radius)))
              : const BoxDecoration(color: Colors.transparent),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //TODO make sure options do not overflow
              if (options.isNotEmpty && showOptions)
                ListView.builder(
                  itemCount: options.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                  itemBuilder: (context, index) =>
                      BubbleChatOption(
                        option: options[index],
                        function: chatController.selectOption,
                      ),
                ),
              ChatOptionsTextField(chatController: chatController, changeOptionsVisibilityState: changeOptionsVisibilityState)
            ],
          ),
        ),
      );
    }
      ,);

  }
}
