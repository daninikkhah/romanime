import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'characters_list_provider.dart';
import '../profile_data_provider.dart';
import 'matched_characters_provider.dart';

class DataManager{
  static Future<void> initialise(BuildContext context)async {
    await Future.wait([
    Provider.of<CharactersListProvider>(context, listen: false)
        .getNewCharacters(context),
    Provider.of<ProfileDataProvider>(context, listen: false).initialize(),
    Provider.of<MatchedCharactersProvider>(context, listen: false).fetchMatchedCharacters(context),
    ]);

  }

  static void deleteCachedDataBuild(BuildContext context){
    Provider.of<CharactersListProvider>(context, listen: false).deleteCachedData();
    Provider.of<MatchedCharactersProvider>(context,listen: false).deleteCachedData();
  }

}