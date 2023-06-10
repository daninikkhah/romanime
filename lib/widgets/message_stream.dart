import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:romanime/constants.dart';
import '../control/characters_messages_list.dart';
import 'player_message_bubble.dart';
import 'animated_player_message_bubble.dart';
import 'ai_characters_message_bubble.dart';
import 'animated_ai_characters_message_bubble.dart';
import 'player_message_bubble_transition.dart';
import 'ai_character_message_bubble_transition.dart';
import '../control/state_management/character_chat_controller_provider.dart';
import '../control/state_management/chat_controller.dart';
import '../control/models/message.dart';



class MessageStream extends StatefulWidget {
  const MessageStream(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  State<MessageStream> createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterChatControllerProvider>(
      builder: (context,chatControllerProvider,_) {
        ChatController chatController = chatControllerProvider.chatControllers[widget.id]!; //TODO: handle null case
        return ListView.builder(
            itemCount: chatController.messages.length,
            reverse: true,
            // ignore: curly_braces_in_flow_control_structures, curly_braces_in_flow_control_structures
            itemBuilder: (context, index) {
              Message message = chatController.messages[index]  ;

              if (index == 0) {
                return message.sender == MessageSender.player
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
                      key: ValueKey(DateTime.now().toIso8601String() + message.toString()),
                    ),
                    const Spacer(),
                  ],
                );
              }

              if (index == 1) {

                return message.sender == MessageSender.player
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

              return message.sender == MessageSender.player
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
    );
  }
}
