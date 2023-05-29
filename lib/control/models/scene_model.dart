import 'dart:developer';
import 'scene_meta_data.dart';
import 'scene_element_abstract_model.dart';
import 'variable.dart';

class SceneModel {
  SceneModel({required this.sceneMetaData, required this.elements});

  final SceneMetaData sceneMetaData;
  final Map<String,SceneElementAbstractModel> elements;

  factory SceneModel.fromJson(Map<String, dynamic> jsonData,List<Variable>? variables) {

    SceneMetaData sceneMetaData = SceneMetaData.fromJson(
      currentElement: jsonData['current_element'],
      tagToIdMap: jsonData['element_stats']['all_tags'],
      finalId: jsonData['element_stats']['ender'],
      initialId: jsonData['element_stats']['starter']?? '0',
      variables: variables
    );
    Map<String, dynamic> elementsMap = jsonData['elements'];
    final Map<String,SceneElementAbstractModel> sceneElements = {};
    elementsMap.forEach((key, value) {
      Map<String, dynamic> currentElementJson = elementsMap[key];
      sceneElements.putIfAbsent(key,()=>SceneElementAbstractModel.fromJson(currentElementJson, key));
    });

    return SceneModel(sceneMetaData: sceneMetaData, elements: sceneElements);
  }

  @override
  String toString() {
   bool firstLine = true;
    String string = 'sceneMetaData: $sceneMetaData \n elements: [';
    elements.forEach((key, element) { if(!firstLine)  string += '\n ';
    else firstLine = false;
    string += element.toString();
    });
    string += ' ] ';
    return string;
  }

}
