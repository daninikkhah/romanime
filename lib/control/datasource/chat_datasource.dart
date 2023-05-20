import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:romanime/control/models/scene_model.dart';
import '../../constants.dart';
import 'mock_data.dart';

class ChatDataSource {
  static final _user = FirebaseAuth.instance.currentUser;

  static Future<Map<String, dynamic>?> getVarList(String characterID) async {
    Map<String, dynamic> varList = {};
    if (_user == null) {
      return null;
    }
    final String token = await _user!.getIdToken();
    final response = await http.post(
      Uri.parse(firebaseUrl + 'get_current_var_list'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({"character_id": characterID}),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      print('chatDatasource error: ' + response.reasonPhrase.toString());
      print(response.body);

      //TODO: throw exception
    } else {
      varList = json.decode(response.body);
    }
    return varList;
  }

   static Future<SceneModel?> getCurrentScene(String characterID) async {
    // return List<element>
    if (_user == null) {

      // return null; TODO: uncomment
    }
    // manageData(mockJsonSceneData);

    final String token = await _user!.getIdToken();
    final Map<String, dynamic>? varList = await getVarList(characterID);
    if (varList == null) {
      return null;
    }
    final response = await http.post(
      Uri.parse(firebaseUrl + 'get_current_scene'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({"character_id": characterID}),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      print('chatDatasource error: ' + response.reasonPhrase.toString());
      print(response.body);

      //TODO: throw exception
    } else {
      ////todo
      final decodedData = json.decode(response.body);
      return SceneModel.fromJson(decodedData);

    }
    return null;
  }
}
