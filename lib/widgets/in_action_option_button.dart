import 'package:flutter/material.dart';

const Radius _radius = Radius.circular(40);

enum ButtonPosition { start, middle, end, only }

class InActionOptionButton extends StatelessWidget {
  const InActionOptionButton({Key? key, required this.text,this.position = ButtonPosition.middle,required this.onPressed}) : super(key: key);
  final ButtonPosition position;
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width*0.9,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
          style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: MaterialStateProperty.all<Color>(Colors.purple.withOpacity(0.5)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: position == ButtonPosition.only? const BorderRadius.all(_radius) :
                position == ButtonPosition.start ?
                    const BorderRadius.only(topLeft: _radius,topRight: _radius) :
                    position == ButtonPosition.middle ?
                        const BorderRadius.all(Radius.circular(0)):
                        const BorderRadius.only(bottomLeft: _radius,bottomRight: _radius)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
