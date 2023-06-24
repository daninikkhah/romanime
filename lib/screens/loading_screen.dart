import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const Color _primaryColor = Color(0xFFAB3DDF);
const Color _secondaryColor = Color.fromRGBO(124, 17, 174,59);

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            color: _secondaryColor,
            child: const Center(
              child: SpinKitPouringHourGlassRefined(
                color: Colors.amberAccent,
                size: 128,
              )
              ,
            ),
          )),
        ],
      )
    );
  }
}
