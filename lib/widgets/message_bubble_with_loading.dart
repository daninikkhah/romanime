import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'is_typing_message_bubble.dart';
import 'message_bubble.dart';

const double _radius = 15;

class MessageBubbleWithLoading extends StatefulWidget {
  const MessageBubbleWithLoading(
      {Key? key, required this.text, this.bIsMe = true})
      : isLoading = !bIsMe,
        super(key: key);

  final String text;
  final bool bIsMe;
  final bool isLoading;

  @override
  State<MessageBubbleWithLoading> createState() =>
      _MessageBubbleWithLoadingState();
}

class _MessageBubbleWithLoadingState extends State<MessageBubbleWithLoading> {
  bool bIsTyping = true;

  @override
  Widget build(BuildContext context) {
    if(!widget.bIsMe) {
      Timer(const Duration(seconds: 2), () {
        setState(() {
          bIsTyping = false;
        });
      });
    }
    final double _width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(seconds: 5),
      child: widget.bIsMe
          ? MessageBubble(text: widget.text, isLoading: false)
          :
      bIsTyping? const IsTypingMessageBubble():
      MessageBubble(text: widget.text, isLoading: false, bIsMe: false,)

      ,
    );
  }
}
