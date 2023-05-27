import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../control/state_management/chat_controller.dart';
import '../constants.dart';
import 'bubble_chat_option.dart';
import '../screens/date_screen.dart';
import '../screens/in_chat_date_screen.dart';
import '../control/character_messages.dart';
import '../control/message.dart';
import '../control/BobsFile.dart';
import '../control/characters_messages_list.dart';
import '../control/models/player_option.dart';


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
  bool _setOptionsVisible = true;
  bool _showOptions = false;


  @override
  Widget build(BuildContext context) {
    return Consumer<ChatController>(builder:
    (context,chatController,_){
      List<PlayerOption> options = chatController.options;
      String selectedOptionPreview = chatController.selectedOption == null? '' : chatController.selectedOption!.previewText;
      _showOptions = true;
      if (chatController.options.isEmpty) {
        _showOptions = false;
      }

      // final Size screenSize = MediaQuery
      //     .of(context)
      //     .size; //TODO: remove if it is not used

      return AnimatedSize(
        duration: Duration(milliseconds: options.length < 4
            ? 200 + options.length * 50
            : 400),

        child: Container(
          decoration: _showOptions && _setOptionsVisible
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
              if (_showOptions && _setOptionsVisible)
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

              Padding(
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
                    onPressed: options.isEmpty
                        ? null
                        : () {
                      setState(() {
                        _setOptionsVisible = !_setOptionsVisible;
                      });
                    },
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 20, left: 10),
                          child: Icon(Icons.add_circle_outline,
                              size: 30, color: _primaryColor),
                        ),
                        Expanded(
                          child: selectedOptionPreview == ''
                              ? const Text('select a message',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: _primaryTextColor,
                                  fontWeight: FontWeight.w700))
                              : AnimatedTextKit(
                            key: ValueKey<String>(selectedOptionPreview),
                            animatedTexts: [
                              TyperAnimatedText(selectedOptionPreview,
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
              )
            ],
          ),
        ),
      );
    }
      ,);

  }
}
