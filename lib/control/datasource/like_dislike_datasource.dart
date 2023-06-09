import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../constants.dart';
import '../models/character.dart';

class LikeDislikeDatasource {
//likes_character
  static void like(String characterID) async {
    final _user = FirebaseAuth.instance.currentUser;
    if (_user != null) {
      final String token = await _user.getIdToken();
      final response =
      await http.post(Uri.parse(firebaseUrl + 'likes_character'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
          body: json.encode({"character_id": characterID}));

       if (response.statusCode < 200 && response.statusCode >= 300) {
        print(
            'likeDislikeDatasource error: ' + response.reasonPhrase.toString());
        print(response.body);

        //TODO: throw exception
      }
    } else {
      //TODO: throw exception

    }
  }

   static Future<List<Character>> fetchLikedCharacters() async{
    //TODO: convert to nullable
      final List<Character> likedCharacters =[];
      final _user = FirebaseAuth.instance.currentUser;
      if(_user != null) {
        final String token = await _user.getIdToken();

        try {
          final response = await http.post(
            Uri.parse(firebaseUrl + 'get_liked_character_list'),
            headers: {
              'Authorization': 'Bearer $token',
            },
          );

          if (response.statusCode == 200) {
            final decodedResponse =
            jsonDecode(response.body) as List<dynamic>;
            for (var characterJsonData in decodedResponse) {
              Character newCharacter = Character.fromJson(characterJsonData);
              likedCharacters.add(newCharacter);
            }

          } else if (response.statusCode < 200 && response.statusCode >= 300) {

            print('likeDislikeDatasource error: ' + response.reasonPhrase.toString());
            print(response.body);

            //TODO: throw exception
          }
        }
        catch (e) {
          print(e);
        }
      }
      return likedCharacters;
  }



}
