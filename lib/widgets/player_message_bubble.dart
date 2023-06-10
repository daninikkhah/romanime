import 'package:flutter/material.dart';
import '../control/models/message.dart';
import '../control/models/message.dart';


const double _radius = 30;
const Color _bubbleBackgroundColor = Color(0xFFA129FF);

class PlayerMessageBubble extends StatelessWidget {
  const PlayerMessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Material(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(_radius),
            topRight: Radius.circular(_radius),
            bottomLeft: Radius.circular(_radius)),
        color: _bubbleBackgroundColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: _width * 0.6),
              child: Text(
                message.value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }
}
