
class SceneMetaData {
  SceneMetaData(
      {required this.currentElement,
      required this.tagToIdMap,
      required this.finalId,
      required this.initialId});

  final String currentElement;
  final Map<String, String> tagToIdMap;
  final String finalId;
  final String initialId;

  factory SceneMetaData.fromJson({String? currentElement, Map<String, dynamic>? tagToIdMap, String? finalId, String? initialId}) {
    final Map<String,String> convertedTAgToIdMAp;
    convertedTAgToIdMAp =  tagToIdMap == null? {} : tagToIdMap.map((key, value) => MapEntry(key, value.toString()));
    return SceneMetaData(
            currentElement: currentElement ?? ' null',
            tagToIdMap: convertedTAgToIdMAp,
            finalId: finalId ?? 'null',
            initialId: initialId ?? 'null');
  }

  @override
  String toString() => '{currentElement: '+ currentElement + ', tagToIdMap: ' + tagToIdMap.toString() + ', finalId: '+ finalId+ ', initialId: '+ initialId+'}';
}
