import 'package:flutter/material.dart';

  const Color _backgrondColor =Color(0xFFE8B8FF);
const Color _foregrondColor =Color(0xFFFA00FF);

class HorizontalProgressBar extends StatelessWidget {
  const HorizontalProgressBar(this.percentage, {Key? key}) : super(key: key);
  final double percentage;

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(width: _width,height: 8,color: _backgrondColor,),
        Container(width: _width*percentage,height: 8,color: _foregrondColor,)
      ],
    );
  }
}
