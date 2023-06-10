import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../control/models/message.dart';
import '../control/models/message.dart';
import '../constants.dart';


const Color _bubbleBackgroundColor = Color(0xFFE6E6E6);
const Color _bubbleTextColor = Color(0xFF424242);

const double _radius = 30;

class AnimatedAiCharactersMessageBubble extends StatefulWidget {
  const AnimatedAiCharactersMessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  State<AnimatedAiCharactersMessageBubble> createState() =>
      _AnimatedAiCharactersMessageBubbleState();
}

class _AnimatedAiCharactersMessageBubbleState
    extends State<AnimatedAiCharactersMessageBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500))
    ..forward();
  late final Animation<Offset> _offsetAnimation =
  Tween<Offset>(begin: const Offset(-2, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
  bool bIsTyping = true;

  void changeTypingStatus(){
    setState(() {
      bIsTyping = false;
    });
  }
  Timer? timer;
  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    timer = null;
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery
        .of(context)
        .size
        .width;
    timer = Timer(const Duration(milliseconds: 2000), () => changeTypingStatus());
    //TODO fix the error (timer is calling the function after widgets dispose)
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
          color: _bubbleBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
              bottomRight: Radius.circular(_radius)),
        ),
        child: AnimatedSize(
          //TODO dynamic animation duration
          duration: Duration(
              milliseconds: widget.message.value.length < 30
                  ? widget.message.value.length * 15
                  : 250), // TODO figure out the numbers
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: bIsTyping
                ? const SpinKitThreeBounce(
              color: _bubbleTextColor,
              size: 16,
            )
                : ConstrainedBox(
                constraints: BoxConstraints(maxWidth: _width * 0.6),
                child:
                widget.message.type == MessageType.picture
                    ? ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(_radius),
                      topRight: Radius.circular(_radius),
                      bottomRight: Radius.circular(_radius)),
                  child: Image.asset(widget.message.value),
                )
                    :
                Text(
                  widget.message.value,
                  style: const TextStyle(
                    fontSize: 18,
                    color: _bubbleTextColor,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
