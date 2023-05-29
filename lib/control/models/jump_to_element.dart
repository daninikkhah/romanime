import 'condition.dart';
import 'variable.dart';

class JumpToElement {
  JumpToElement({required this.conditions, required this.goToElement});

  final List<Condition> conditions;
  /// goes to this element id if none of the conditions are met
  final String goToElement;

  factory JumpToElement.fromJson(Map<String, dynamic> jsonData) {
    List<dynamic> conditionsJson = jsonData['conditions'];
    final List<Condition> conditions = conditionsJson
        .map((jsonConditionData) => Condition.fromJson(jsonConditionData))
        .toList();

    return JumpToElement(
        conditions: conditions, goToElement: jsonData['goto']);
  }

  bool meetsConditions(List<Variable> variables){

    bool result = true;

    for(Condition condition in conditions){
      result = result && condition.evaluateVariables(variables);
    }
    return result;
  }

  @override
  String toString() => '{ conditions: ${conditions.toString()},  goToElement: $goToElement }';
}
