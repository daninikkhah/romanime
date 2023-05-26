import 'package:flutter/material.dart';
import '../control/models/player_option.dart';

const Color _primaryColor = Color(0xFFA129FF);

class BubbleChatOption extends StatelessWidget {
  const BubbleChatOption({Key? key,required this.option, required this.function})
      : super(key: key);
  final void Function(PlayerOption) function;
  final PlayerOption option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            // MaterialStateProperty.all<EdgeInsetsGeometry>(
            //     const EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
            backgroundColor: _primaryColor,
            //MaterialStateProperty.all<Color>(_primaryColor),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            side: const BorderSide(color: Colors.white, width: 2)
            // MaterialStateProperty.all<OutlinedBorder>(
            //   const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(20),
            //           topRight: Radius.circular(20),
            //           bottomLeft: Radius.circular(20))),
            // ),
            ),
        onPressed: () => function(option),
        child: Text(
          option.previewText,
          style: const TextStyle(
            fontSize: 18,
          ),
          softWrap: true,
        ),
      ),
    );
  }
}
