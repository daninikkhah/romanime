import 'package:flutter/material.dart';
import '../control/models/character.dart';
import '../control/state_management/like_dislike.dart';
import 'matched_popup_alert.dart';

const double _iconSize = 60;
const Color _color = Color.fromRGBO(171, 0, 251, 1);
const Color _darkPrimaryColor = Color(0xFF450066);
const Color _accentPrimaryColor = Color(0xFFAB00FB);

class LikeDislikeButton extends StatelessWidget {
  const LikeDislikeButton({required this.character, Key? key})
      : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            icon: const Icon(
              Icons.clear,
              size: _iconSize,
              color: _darkPrimaryColor,
            ),
            iconSize: _iconSize,
            onPressed: () => LikeDislike.dislike(context)),
        Container(
            child: const SizedBox(
              width: 1,
              height: 60,
            ),
            color: Colors.white),
        IconButton(
          icon: const Icon(
            Icons.favorite,
            size: _iconSize,
            color: _accentPrimaryColor,
          ),
          iconSize: _iconSize,
          onPressed: () => LikeDislike.like(
            context: context,
            character: character,
            matchedPopUpAlert:
                matchedPopUpAlert(context: context, characterId: character.id),
          ),
        ),
      ],
    );
  }
}
