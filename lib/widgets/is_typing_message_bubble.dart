import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const double _radius = 15;

class IsTypingMessageBubble extends StatelessWidget {
  const IsTypingMessageBubble({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Material(
        borderRadius:
         BorderRadius.only(
            topLeft: Radius.circular(_radius),
            topRight: Radius.circular(_radius),
            bottomRight: Radius.circular(_radius)),
        color:
        Colors.black54,
        elevation: 5,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child:  SpinKitThreeBounce(
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
