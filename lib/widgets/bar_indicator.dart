import 'package:flutter/material.dart';

class BarIndicator extends StatelessWidget {
  const BarIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.grey),
      width: 10,
      height: 100,
      child: FractionallySizedBox(
        alignment: Alignment.bottomCenter,
        heightFactor: 0.8,
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.purple),
        ),
      ),
    );
  }
}
