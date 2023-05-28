
import 'variable.dart';

enum ConditionalOperator{equal,greater,smaller}

class Condition{
  Condition({required this.operator,required this.variable});
  final ConditionalOperator operator;
  final Variable variable;

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

    return Condition(operator: conditionalOperator, variable: Variable.fromJson(name: jsonData['var'], value: jsonData['val']));

  }

  @override
  String toString()=> '{ $operator $variable }';
}