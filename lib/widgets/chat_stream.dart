import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/state_management/character_chat_controller_provider.dart';
import '../control/state_management/chat_controller.dart';
import '../control/models/abstract_message.dart';
import '../control/models/text_message.dart';
import 'animated_message_bubble.dart';
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
    print(messages);

    return AnimatedList(
      key: chatController?.animatedListKey,
      initialItemCount: messages.length,
      reverse: true,
      itemBuilder: (context, index, animation) {
        final TextMessage message = messages[index] as TextMessage;
        return AnimatedMessageBubble(message: message, animation: animation);
      },
    );
  }
}
