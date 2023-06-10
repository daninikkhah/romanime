import 'package:flutter/material.dart';
import 'package:romanime/constants.dart';
import '../control/models/message.dart';
import 'player_message_bubble.dart';
import 'ai_characters_message_bubble.dart';

class AnimatedMessageBubble extends StatelessWidget {
  const AnimatedMessageBubble({required this.message, required this.animation,Key? key}) : super(key: key);
  final Message message;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
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
  }
}
