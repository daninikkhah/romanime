import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'player_message_bubble.dart';
import 'ai_characters_message_bubble.dart';
import '../constants.dart';
import '../control/state_management/character_chat_controller_provider.dart';
import '../control/state_management/chat_controller.dart';
import '../control/models/abstract_message.dart';
import '../control/models/text_message.dart';

class ChatStream extends StatelessWidget {
  const ChatStream({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final ChatController? chatController =
        Provider.of<CharacterChatControllerProvider>(context)
            .chatControllers[id];
    chatController?.initiateScene();
    final List<AbstractMessage> messages =
        chatController == null ? [] : chatController.messages;

    return AnimatedList(
      key: chatController?.animatedListKey,
      initialItemCount: 0,
      reverse: true,
      itemBuilder: (context, index, animation) {
        print('current message: $messages');
        final TextMessage message = messages[index] as TextMessage;
        return message.sender == MessageSender.player
            ? Row(
                children: [
                  const Spacer(),
                  SizeTransition(
                    sizeFactor: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(0, 1), end: Offset.zero)
                          .animate(animation),
                      child: PlayerMessageBubble(
                          message: message,
                          key: ValueKey(
                            DateTime.now().toIso8601String() +
                                message.toString(),
                          )),
                    ),
                  )
                ],
              )
            : Row(
                children: [
                  SizeTransition(
                    sizeFactor: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(-2, 0), end: Offset.zero)
                          .animate(animation),
                      child: AiCharactersMessageBubble(
                          message: message,
                          key: ValueKey(
                            DateTime.now().toIso8601String() +
                                message.toString(),
                          )),
                    ),
                  ),
                  const Spacer(),
                ],
              );
      },
    );
  }
}
