import 'package:flutter/material.dart';
import '../constants.dart';
import '../control/message.dart';

const double _radius = 30;
const Color _bubbleBackgroundColor = Color(0xFFE6E6E6);
const Color _bubbleTextColor = Color(0xFF424242);

class AiCharactersMessageBubble extends StatelessWidget {
  const AiCharactersMessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {

    final Size _screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Material(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(_radius),
            topRight: Radius.circular(_radius),
            bottomRight: Radius.circular(_radius)),
        color: _bubbleBackgroundColor,
        elevation: 0,
        child: Padding(
          padding: message.type == MessageType.picture? const EdgeInsets.all(4) : const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: _screenSize.width * 0.6,maxHeight: _screenSize.height * 0.5),
              child: message.type == MessageType.picture
                  ? ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(_radius),
                    topRight: Radius.circular(_radius),
                    bottomRight: Radius.circular(_radius)),
                      child: Image.asset(message.message),
                    )
                  : Text(
                      message.message,
                      style: const TextStyle(
                        fontSize: 16,
                        color: _bubbleTextColor,
                      ),
                    )),
        ),
      ),
    );
  }
}
