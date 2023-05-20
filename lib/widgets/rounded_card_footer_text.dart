import 'package:flutter/material.dart';
import '../control/models/character.dart';
import 'package:google_fonts/google_fonts.dart';


final TextStyle _titleTextStyle = GoogleFonts.roboto(fontSize: 42,fontWeight: FontWeight.w900);
final TextStyle _textStyle = GoogleFonts.nunitoSans(fontSize: 22,);


class RoundedCardFooterText extends StatelessWidget {
  RoundedCardFooterText({required this.character});
  final Character character;
  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(child: Container()),
        Row(
          children: [
            Expanded(child: Container()),
            Expanded(
              flex: 5,
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),//TODO
                  ),
                  color: Color.fromRGBO(250, 250, 250, 0.6),
                ),
                padding: EdgeInsets.fromLTRB(25, 10, 25, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: _titleTextStyle,
                      // TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w900),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        character.bio,
                        style: _textStyle,
                        // TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(child: Container(),flex: 2,),
      ],
    );
  }
}