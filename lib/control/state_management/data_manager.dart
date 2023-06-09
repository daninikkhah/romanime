import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'characters_list_provider.dart';
import '../profile_data_provider.dart';
import 'matched_characters_provider.dart';
import '../datasource/remote_chat_datasource.dart';

class DataManager{
  static void initialise(BuildContext context){
    Provider.of<CharactersListProvider>(context, listen: false)
        .getNewCharacters(context);
    Provider.of<ProfileDataProvider>(context, listen: false).initialize();
    Provider.of<MatchedCharactersProvider>(context, listen: false).fetchMatchedCharacters(context);
  }

  static void deleteCachedDataBuild(BuildContext context){
    Provider.of<CharactersListProvider>(context, listen: false).deleteCachedData();
    Provider.of<MatchedCharactersProvider>(context,listen: false).deleteCachedData();
  }

}