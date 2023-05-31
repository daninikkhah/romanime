import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'characters_list_provider.dart';
import 'matched_characters_provider.dart';
import '../models/character.dart';

class LikeDislike {
  static void dislike(BuildContext context) {
    Provider.of<CharactersListProvider>(context, listen: false).dislike();
  }

  static void like(
      {required BuildContext context,
      required Character character,
      required Future<Object> matchedPopUpAlert}) {
    MatchedCharactersProvider matchedCharactersProvider =
        Provider.of<MatchedCharactersProvider>(context, listen: false);
    dislike(context);
    matchedCharactersProvider.like(
        context: context,
        character: character,
        matchedPopUpAlert: matchedPopUpAlert);
  }
}
