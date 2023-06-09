import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../constants.dart';

class CharactersListDatasource {
  static Future<List<Character>?> getCharactersList() async {
    List<Character>? characters = [];
    final _user = FirebaseAuth.instance.currentUser;
    final String token = _user != null ? await _user.getIdToken() : 'Null';

    // Stopwatch stopwatch = Stopwatch()..start(); //TODO delete
    final response = await http.post(
        Uri.parse(firebaseUrl + 'get_character_list'),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      final decodedResponse =
          jsonDecode(response.body) as List<dynamic>;
      for (var characterJsonData in decodedResponse) {
        Character newCharacter = Character.fromJson(characterJsonData);

        characters.add(newCharacter);

      }
      // print(stopwatch.elapsedMicroseconds); //TODO delete

    } else if (response.statusCode == 401 && response.statusCode == 404) {
      //TODO create error handling
      print('charactersListDatasource error: ' +
          response.reasonPhrase.toString());
    } else {
      print('charactersListDatasource error: ' +
          response.reasonPhrase.toString());
    }
    return characters;
  }
}
