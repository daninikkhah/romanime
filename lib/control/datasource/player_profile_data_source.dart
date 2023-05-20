import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/player_profile_data_model.dart';
import '../../constants.dart';

class PlayerProfileDataSource {

  Future<PlayerProfileDataModel?> getUserProfile() async {
    PlayerProfileDataModel? player;
    final _user = FirebaseAuth.instance.currentUser;
    final String token = _user != null ? await _user.getIdToken() : 'Null';

    // Stopwatch stopwatch = Stopwatch()..start(); //TODO delete
    final response = await http.post(
        Uri.parse(firebaseUrl + 'get_user_profile'),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      // print(await response.body);

      // print(stopwatch.elapsedMicroseconds); //TODO delete

      player = PlayerProfileDataModel.fromJson(jsonDecode(response.body));
      // print(player);

    } else if (response.statusCode == 401 && response.statusCode == 404) {
      //TODO create error handling
      print(response.reasonPhrase);
    } else {
      print(response.reasonPhrase);
    }
    return player;
  }

  static Future<void> createNewAccount(String name, String email, String password) async {
    // TODO is probably should move to the state management layer
    final _auth = FirebaseAuth.instance;

    final authenticationResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = authenticationResult.user;

    final String token = user!= null? await user.getIdToken() :'null';

    final Object body = json.encode({
    "name": name
    });

    final response = await http.post(
      Uri.parse(firebaseUrl + 'set_user_profile'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: body
    );
    if (response.statusCode == 401 && response.statusCode == 404) {
      //TODO create error handling
      print(response.reasonPhrase);
    } else {
      print(response.reasonPhrase);
    }
  }
}
