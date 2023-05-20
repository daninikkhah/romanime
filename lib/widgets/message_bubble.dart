import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const double _radius = 30;

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key,
      required this.text,
      required this.isLoading,
      this.bIsMe = true})
      : super(key: key);

  final String text;
  final bool bIsMe;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Material(
        borderRadius: bIsMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(_radius),
                topRight: Radius.circular(_radius),
                bottomLeft: Radius.circular(_radius))
            : const BorderRadius.only(
                topLeft: Radius.circular(_radius),
                topRight: Radius.circular(_radius),
                bottomRight: Radius.circular(_radius)),
        color: bIsMe ? Colors.lightBlueAccent : Colors.black54,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: AnimatedContainer(
            duration: const Duration(seconds: 5),
            child:
            // isLoading
                // ? const SpinKitThreeBounce(
                //     color: Colors.white,
                //     size: 16,
                //   )
                // :
            Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: bIsMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: _width * 0.6),
                              child: Text(
                                text,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
