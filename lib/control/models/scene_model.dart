import 'scene_meta_data.dart';
import 'scene_element_abstract_model.dart';

class SceneModel {
  SceneModel({required this.sceneMetaData, required this.elements});

  final SceneMetaData sceneMetaData;
  final List<SceneElementAbstractModel> elements;

  factory SceneModel.fromJson(Map<String, dynamic> jsonData) {
    SceneMetaData sceneMetaData = SceneMetaData.fromJson(
      currentElement: jsonData['current_element'],
      tagToIdMap: jsonData['element_stats']['all_tags'],
      finalId: jsonData['ender'],
      initialId: jsonData['starter'],
    );
    Map<String, dynamic> elementsMap = jsonData['elements'];
    final List<SceneElementAbstractModel> sceneElements = [];
    elementsMap.forEach((key, value) {
      Map<String, dynamic> currentElementJson = elementsMap[key];
      sceneElements.add(SceneElementAbstractModel.fromJson(currentElementJson));
    });

    return SceneModel(sceneMetaData: sceneMetaData, elements: sceneElements);
  }

  @override
  String toString() {
   int counter = 0;
    String string = 'sceneMetaData: $sceneMetaData \n elements: [';
    for (var element in elements) {
      if(counter > 0)  string += '\n ';
      counter++;
      string += '$counter: $element';
    }
    string += ' ] ';
    return string;
  }

}
