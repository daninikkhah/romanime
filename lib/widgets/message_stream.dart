import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/characters_messages_list.dart';
import '../control/message.dart';
import 'player_message_bubble.dart';
import 'animated_player_message_bubble.dart';
import 'ai_characters_message_bubble.dart';
import 'animated_ai_characters_message_bubble.dart';
import 'player_message_bubble_transition.dart';
import 'ai_character_message_bubble_transition.dart';

class MessageStream extends StatefulWidget {
  const MessageStream(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  State<MessageStream> createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    CharactersMessagesList charactersMessages =
        Provider.of<CharactersMessagesList>(context);
    int index = charactersMessages.getCharacterIndex(widget.id);
    List<Message> messages = charactersMessages.getMessages(index);
    // if(messages.isNotEmpty)
    // _scrollController.animateTo(_scrollController.position.maxScrollExtent -20, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    // messages = [...messages.reversed];
    return ListView.builder(
      controller: _scrollController,
        itemCount: messages.length,
        reverse: true,
        // ignore: curly_braces_in_flow_control_structures, curly_braces_in_flow_control_structures
        itemBuilder: (context, index) {
          Message message = messages[index];

          if (index == 0) {
            return message.bIsMine
                ? Row(
              children: [
                const Spacer(),
                AnimatedPlayerMessageBubble(message: message)
              ],
            )
                : Row(
              children: [
                AnimatedAiCharactersMessageBubble(
                  message: message,
                ),
                const Spacer(),
              ],
            );
          }

          if (index == 1) {
            return message.bIsMine
                ? Row(
              children: [
                const Spacer(),
                PlayerMessageBubbleTransition(message: message)//TODO
              ],
            )
                : Row(
              children: [
                AiCharactersMessageBubbleTransition(
                  message: message,
                ),
                const Spacer(),
              ],
            );
          }


          return message.bIsMine
              ? Row(
                  children: [
                    const Spacer(),
                    PlayerMessageBubble(message: message)
                  ],
                )
              : Row(
                  children: [
                    AiCharactersMessageBubble(
                      message: message,
                    ),
                    const Spacer(),
                  ],
                );
        });
  }
}
