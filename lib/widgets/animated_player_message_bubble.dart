import 'package:flutter/material.dart';
import 'player_message_bubble.dart';
import '../control/message.dart';

class AnimatedPlayerMessageBubble extends StatefulWidget {
  const AnimatedPlayerMessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  State<AnimatedPlayerMessageBubble> createState() => _AnimatedPlayerMessageBubbleState();
}

class _AnimatedPlayerMessageBubbleState extends State<AnimatedPlayerMessageBubble> with SingleTickerProviderStateMixin{
  late final AnimationController _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))..forward();
  //TODO consider making offset dynamic based on the chosen option
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(begin: const Offset(-2,2)   , end: Offset.zero ).animate(CurvedAnimation(
    parent: _animationController,
    curve: Curves.ease,
  ));

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: PlayerMessageBubble(message: widget.message,)
    );
  }
}
