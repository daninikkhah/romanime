import 'variable.dart';

class SceneMetaData {
  const SceneMetaData(
      {required this.currentElementId,
      required this.tagToIdMap,
      required this.finalId,
      required this.initialId,
      required this.variables});

  final String? currentElementId;
  final Map<String, String> tagToIdMap;
  final String? finalId;
  final String initialId;
  final List<Variable> variables;

  factory SceneMetaData.fromJson(
      {String? currentElement,
      Map<String, dynamic>? tagToIdMap,
      String? finalId,
      required String initialId,
      List<Variable>? variables}) {
    final Map<String, String> convertedTAgToIdMAp;
    convertedTAgToIdMAp = tagToIdMap == null
        ? {}
        : tagToIdMap.map((key, value) => MapEntry(key, value.toString()));
    return SceneMetaData(
        currentElementId: currentElement,
        tagToIdMap: convertedTAgToIdMAp,
        finalId: finalId,
        initialId: initialId,
        variables: variables ?? []);
  }

  @override
  String toString() =>
      '{ currentElement: $currentElementId, initialId: $initialId, finalId: $finalId, \n variables: $variables, \n tagToIdMap: $tagToIdMap }';
}
