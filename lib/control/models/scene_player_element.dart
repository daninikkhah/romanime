import 'scene_element_abstract_model.dart';
import 'jump_to_element.dart';
import 'player_option.dart';

class ScenePlayerElement extends SceneElementAbstractModel {
  ScenePlayerElement(
      {required super.id,
      required super.nextElementTag,
      required super.jumpList,
      required this.options,
      super.elementType = ElementType.player});

  final List<PlayerOption> options;

  factory ScenePlayerElement.fromJson(
      Map<String, dynamic> jsonData, String id) {
    final List<dynamic> jsonPlayerOptionList = jsonData['choices'];
    final List<PlayerOption> playerOptionList = jsonPlayerOptionList
        .map((jsonPlayerOptionData) =>
            PlayerOption.fromJson(jsonPlayerOptionData))
        .toList();

    List<dynamic>? jsonJumpList = jsonData['jump'];
    List<JumpToElement>? jumpList = jsonJumpList
        ?.map((jsonJumpData) => JumpToElement.fromJson(jsonJumpData))
        .toList();

    return ScenePlayerElement(
        id: id,
        nextElementTag: jsonData['nextE'],
        jumpList: jumpList,
        options: playerOptionList);
  }

  @override
  String toString() =>
      '{ id: $id, scene player element, next element: $nextElementTag, jump: ${jumpList.toString()}, options: ${options.toString()} }';
}
