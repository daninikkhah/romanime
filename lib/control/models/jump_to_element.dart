import 'condition.dart';

class JumpToElement {
  JumpToElement({required this.conditions, required this.elseGoToElement});

  final List<Condition> conditions;
  /// goes to this element id if none of the conditions are met
  final String elseGoToElement;

  factory JumpToElement.fromJson(Map<String, dynamic> jsonData) {
    List<dynamic> conditionsJson = jsonData['conditions'];
    final List<Condition> conditions = conditionsJson
        .map((jsonConditionData) => Condition.fromJson(jsonConditionData))
        .toList();

    return JumpToElement(
        conditions: conditions, elseGoToElement: jsonData['goto']);
  }

  @override
  String toString() => '{ conditions: ${conditions.toString()}, else go to element: $elseGoToElement }';
}
