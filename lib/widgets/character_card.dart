import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../control/models/character.dart';
import 'rounded_card_footer_text.dart';
import 'character_information_widget.dart';
import 'character_image_loader.dart';

const double kRadius = 20;

class CharacterCard extends StatefulWidget {
  const CharacterCard({Key? key, required this.character, required this.height})
      : super(key: key);

  final Character character;
  final double height;

  @override
  _CharacterCardState createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  bool bShowDetails = false;

  @override
  Widget build(BuildContext context) {
    double _appBarHeight = AppBar().preferredSize.height;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double _customHeight =
        height - _appBarHeight - 190; //TODO use dynamic height


    return GestureDetector(
      onTap: () => setState(() => bShowDetails = !bShowDetails),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffE1BEE7),
          borderRadius: BorderRadius.circular(kRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kRadius),
          child: SizedBox(
            // color:Colors.blue,
            width: width - 20,
            height: _customHeight,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(kRadius),
                      topLeft: Radius.circular(kRadius)),
                  child:
                  CharacterImageLoader(characterId: widget.character.id, width: width, customHeight: _customHeight),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: width - 20,
                    height: _customHeight / 2,
                    child: !bShowDetails
                        ? RoundedCardFooterText(
                            character: widget.character,
                          )
                        : Container(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, bottom: 20, top: 50),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurple.withOpacity(0.2),
                                  Colors.deepPurple.withOpacity(0.7),
                                  Colors.deepPurple.withOpacity(0.9)
                                ])),
                            //TODO: change to ListView
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(widget.character.description,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    )),
                                const SizedBox(height: 10,),
                                CharacterInformationWidget(character: widget.character),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




