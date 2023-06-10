import 'scene_element_abstract_model.dart';
import 'jump_to_element.dart';
import 'message.dart';
import '../../constants.dart';

class AiSceneElement extends SceneElementAbstractModel {
  AiSceneElement(
      {required super.id,
      required super.nextElementTag,
      required super.jumpList,
      super.elementType = ElementType.ai,
      required this.messages});

  final List<Message> messages;

  factory AiSceneElement.formJson(Map<String, dynamic> jsonData, String id) {
    List<dynamic> jsonMessagesList = jsonData['texts'];
    List<Message> messagesList = jsonMessagesList
        .map((jsonMessage) =>
            Message.formJson(jsonMessage, MessageSender.ai))
        .toList();

    List<dynamic>? jsonJumpList = jsonData['jump'];
    List<JumpToElement>? jumpList = jsonJumpList
        ?.map((jsonJumpData) => JumpToElement.fromJson(jsonJumpData))
        .toList();

    return AiSceneElement(
        id: id,
        nextElementTag: jsonData['nextE'],
        jumpList: jumpList,
        messages: messagesList);
  }

  @override
  String toString() =>
      '{ id: $id, AiElement, next element: $nextElementTag, jump to element: ${jumpList.toString()}, messages: ${messages.toString()} }';
}
