import 'variable.dart';

enum ConditionalOperator{equal,greater,smaller}

class Condition{
  Condition({required this.operator,required this.conditionValue});
  final ConditionalOperator operator;
  final Variable conditionValue;

  factory Condition.fromJson(Map<String, dynamic> jsonData) {
    final ConditionalOperator conditionalOperator;
    switch(jsonData['opt']){
      case '==':
        conditionalOperator = ConditionalOperator.equal;
        break;
      case'>': //TODO: check if this is correct
        conditionalOperator = ConditionalOperator.greater;
        break;
      case '<'://TODO: check if this is correct
        conditionalOperator = ConditionalOperator.smaller;
        break;
        default:
          conditionalOperator = ConditionalOperator.equal;
          break;
    }

    return Condition(operator: conditionalOperator, conditionValue: Variable.fromJson(name: jsonData['var'], value: jsonData['val']));

  }

  bool evaluateVariable(Variable variable){
    if(variable.type == conditionValue.type && variable.name == conditionValue.name) {
      switch (operator) {
        case ConditionalOperator.equal:
          return conditionValue.isEqualTo(variable);

        case ConditionalOperator.greater:
          return conditionValue.isGreaterThan(variable);

        case ConditionalOperator.smaller:
          return conditionValue.isSmallerThan(variable);
      }
    }
    return false;
  }

  bool evaluateVariables(List<Variable> variables){
    bool result = false;
    for(Variable variable in variables){
      result = result || evaluateVariable(variable);
    }
    return result;
  }

  @override
  String toString()=> '{ $operator $conditionValue }';
}