import 'scene_element_abstract_model.dart';
import 'jump_to_element.dart';
import 'abstract_message.dart';
import '../../constants.dart';

class AiSceneElement extends SceneElementAbstractModel {
  AiSceneElement(
      {required super.id,
      required super.nextElement,
      required super.jumpList,
      super.elementType = ElementType.ai,
      required this.messages});

  final List<AbstractMessage> messages;

  factory AiSceneElement.formJson(Map<String, dynamic> jsonData, String id) {
    List<dynamic> jsonMessagesList = jsonData['texts'];
    List<AbstractMessage> messagesList = jsonMessagesList
        .map((jsonMessage) =>
            AbstractMessage.formJson(jsonMessage, MessageSender.ai))
        .toList();

    List<dynamic>? jsonJumpList = jsonData['jump'];
    List<JumpToElement>? jumpList = jsonJumpList
        ?.map((jsonJumpData) => JumpToElement.fromJson(jsonJumpData))
        .toList();

    return AiSceneElement(
        id: id,
        nextElement: jsonData['nextE'],
        jumpList: jumpList,
        messages: messagesList);
  }

  @override
  String toString() =>
      '{ id: $id, AiElement, next element: $nextElement, jump to element: ${jumpList.toString()}, messages: ${messages.toString()} }';
}
