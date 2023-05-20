import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  CircularIconButton({required this.onTap,required this.icon});
  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Icon(
        icon,
        size: 40,
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.purpleAccent),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              CircleBorder())),
    );
  }
}