import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants.dart';
import 'bubble_chat_option.dart';
import '../screens/date_screen.dart';
import '../screens/in_chat_date_screen.dart';
import '../control/character_messages.dart';
import '../control/message.dart';
import '../control/BobsFile.dart';
import '../control/characters_messages_list.dart';


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
  int _selectedOption = -1;
  String _selectedMessage = '';
  Conversation _response = Conversation(MessageType.text, '');
  late final CharacterMessages _characterMessages;
  late Talk _talk = _characterMessages.talksList[0];// TODO check if it's fine
  late Talk _oldTalk = _characterMessages.talksList[0];// TODO check if it's fine

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _characterMessages = Provider.of<CharactersMessagesList>(context,listen: false).getCharacterMessages(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final int _optionsCount =_talk.options.length;
    _showOptions = true;
    if(_talk.options.isEmpty){
      _showOptions = false;
    }

    final Size _screenSize = MediaQuery.of(context).size;
    return AnimatedSize(
      duration:  Duration(milliseconds: _optionsCount< 4? 200 + _talk.options.length*50 : 400),

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
                itemCount: _talk.options.length,
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(0,20,0,5),
                itemBuilder: (context, index) => BubbleChatOption(
                  text: _talk.options[index].textsList[0],
                  function: () {
                    //TODO
                    setState(() {
                      _selectedMessage = _talk.options[index].textsList[0];
                      _selectedOption = index;

                    });
                  },
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
                  onPressed: _talk.options.isEmpty
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
                        child: _selectedMessage == ''
                            ? const Text('select the message',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: _primaryTextColor,
                                    fontWeight: FontWeight.w700))
                            : AnimatedTextKit(
                                key: ValueKey<String>(_selectedMessage),
                                animatedTexts: [
                                  TyperAnimatedText(_selectedMessage,
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
                          onPressed: () async {

                            if (_selectedMessage != '') {
                              final charactersMessageList =
                                  Provider.of<CharactersMessagesList>(context,
                                      listen: false);
                              //add players message
                              charactersMessageList.addMessage(
                                  Message(message: _selectedMessage), widget.id);
                              List<String> _selectedOptionMessages = _talk.options[_selectedOption].textsList;
                              if(_selectedOptionMessages.length > 1) {
                                for (int i = 1; i <
                                    _selectedOptionMessages.length; i++) {
                                  String message = _selectedOptionMessages[i];
                                  await Future.delayed(
                                      const Duration(milliseconds: 200));
                                  setState(() {
                                    _selectedMessage = message;
                                  });
                                  await Future.delayed(Duration(
                                      milliseconds: message.length * 80 + 200));
                                  charactersMessageList.addMessage(
                                      Message(message: message), widget.id);
                                }
                              }

                              //changes
                              List<Conversation> responses;
                              responses = _characterMessages.nextTalk(
                                  _talk.options[_selectedOption].next).conversations;

                              setState(() {
                                _selectedMessage = '';
                                _talk =Talk(-1, [], []);
                              });

                              for(Conversation conversation in responses){
                                await Future.delayed(
                                     Duration(milliseconds: conversation.content.length * 80 + 200));
                                  _response = conversation;

                                //add response
                                charactersMessageList.addMessage(
                                    Message(message: _response.content, bIsMine: false,type: _response.type ),
                                    widget.id);
                                await Future.delayed(
                                    const Duration(milliseconds: 1200));
                              }

                              //end of changes

                              // get the next talk
                              // setState(() {
                              //   _selectedMessage = '';
                              //   _response = _characterMessages.nextTalk(
                              //       _talk.options[_selectedOption].next).conversations[0];
                              //   _talk =Talk(-1, [], []);
                              // });
                              // //TODO add dynamic delay based on length of the text
                              //
                              // await Future.delayed(
                              //     const Duration(milliseconds: 1200));
                              // //add response
                              // charactersMessageList.addMessage(
                              //     Message(message: _response.content, bIsMine: false,type: _response.type ),
                              //     widget.id);

                              await Future.delayed(
                                  const Duration(milliseconds: 2400));

                              setState(() {
                                _selectedMessage = '';
                                _talk = _characterMessages.nextTalk(
                                    _oldTalk.options[_selectedOption].next);
                              });
                              _oldTalk = _talk;
                            }
                          })
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
