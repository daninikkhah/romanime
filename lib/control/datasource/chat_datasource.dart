import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import '../../constants.dart';
import '../models/scene_meta_data.dart';
import 'mock_data.dart';
import '../models/scene_element_abstract_model.dart';

void manageData(String jsonSceneData){
  // print('/////////////////////////////// logging response //////////////////////////////////////////');
  // log(jsonSceneData);
  final decodedData = json.decode(jsonSceneData);
  SceneMetaData sceneMetaData = SceneMetaData.fromJson(
    currentElement: decodedData['current_element'],
    tagToIdMap: decodedData['element_stats']['all_tags'],
    finalId: decodedData['ender'],
    initialId: decodedData['starter'],
  );
  Map<String, dynamic> elementsMap = decodedData['elements'];
  final List<SceneElementAbstractModel> sceneElements = [];
  elementsMap.forEach((key, value) {
    Map<String, dynamic> currentElementJson = elementsMap[key];
    sceneElements.add(SceneElementAbstractModel.fromJson(currentElementJson));
  });
  print('////////////////////// printing scene metadata ///////////////////');
  print(sceneMetaData);
  print('////////////////////// printing scene elements ///////////////////');
  sceneElements.forEach((element) {print(element);});
}

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

   static void getCurrentScene(String characterID) async {
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
      manageData(response.body);
    }
  }
}
