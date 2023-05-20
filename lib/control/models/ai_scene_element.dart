import 'scene_element_abstract_model.dart';
import 'jump_to_element.dart';
import 'abstract_message.dart';

class AiSceneElement extends SceneElementAbstractModel {
  AiSceneElement(
      {required super.nextElement,
      required super.jumpList,
      super.elementType = ElementType.ai,
      required this.messages});

  final List<AbstractMessage> messages;

  factory AiSceneElement.formJson(Map<String, dynamic> jsonData) {

    List<dynamic> jsonMessagesList = jsonData['texts'];
    List<AbstractMessage> messagesList = jsonMessagesList.map((jsonMessage) => AbstractMessage.formJson(jsonMessage)).toList();

    List<dynamic>? jsonJumpList = jsonData['jump'];
    List<JumpToElement>? jumpList = jsonJumpList == null? null : jsonJumpList.map((jsonJumpData) =>JumpToElement.fromJson(jsonJumpData) ).toList();

    return AiSceneElement(
        nextElement: jsonData['nextE'],
        jumpList: jumpList,
        messages: messagesList);
  }

  @override
  String toString() =>
      '{ AiElement, next element: $nextElement, jump to element: ${jumpList.toString()}, messages: ${messages.toString()} }';
}
