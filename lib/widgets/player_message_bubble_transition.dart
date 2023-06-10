import 'package:flutter/material.dart';
import 'player_message_bubble.dart';
import '../control/models/message.dart';
import '../control/models/message.dart';

class PlayerMessageBubbleTransition extends StatefulWidget {
  const PlayerMessageBubbleTransition({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  State<PlayerMessageBubbleTransition> createState() => _PlayerMessageBubbleTransitionState();
}

class _PlayerMessageBubbleTransitionState extends State<PlayerMessageBubbleTransition> with SingleTickerProviderStateMixin {
  bool bIsTyping = true;
  late final AnimationController _animationController =AnimationController(vsync: this, duration: const Duration(milliseconds: 300))..forward();
  late final Animation<double> _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear);
  // late final Animation<Offset> _offsetAnimation = Tween<Offset>(begin:  Offset.zero  , end: Offset(0,-0.10) ).animate(CurvedAnimation(
  //   parent: _animationController,
  //   curve: Curves.ease,
  // ));

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor: _animation,
        child: PlayerMessageBubble(message: widget.message,)
    );
  }
}
