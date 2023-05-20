import 'package:flutter/material.dart';
import 'ai_characters_message_bubble.dart';
import '../control/message.dart';


class AiCharactersMessageBubbleTransition extends StatefulWidget {
  const AiCharactersMessageBubbleTransition({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  State<AiCharactersMessageBubbleTransition> createState() => _AiCharactersMessageBubbleTransitionState();
}

class _AiCharactersMessageBubbleTransitionState extends State<AiCharactersMessageBubbleTransition> with SingleTickerProviderStateMixin {
  bool bIsTyping = true;
  late final AnimationController _animationController =AnimationController(vsync: this, duration: const Duration(milliseconds: 300))..forward();
  late final Animation<double> _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      child: AiCharactersMessageBubble(message: widget.message,)
    );
  }
}
