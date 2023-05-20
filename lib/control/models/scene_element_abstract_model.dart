import 'jump_to_element.dart';
import 'ai_scene_element.dart';
import 'scene_player_element.dart';
import 'condition.dart';

enum ElementType { player, ai }

abstract class SceneElementAbstractModel {
  SceneElementAbstractModel(
      {required this.nextElement,
      required this.jumpList,
      required this.elementType});

  final String? nextElement;
  final List<JumpToElement>? jumpList;
  final ElementType elementType;

  factory SceneElementAbstractModel.fromJson(
          Map<String, dynamic> jsonElementData) =>
      jsonElementData['type'] == 'text'
          ? AiSceneElement.formJson(jsonElementData)
          : ScenePlayerElement.fromJson(jsonElementData);
}
