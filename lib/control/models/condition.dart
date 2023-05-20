
enum ConditionalOperator{equal,greater,smaller}

class Condition{
  Condition({required this.operator,required this.variableName, required this.value});
  final ConditionalOperator operator;
  final String variableName;
  final int value;

  factory Condition.fromJson(Map<String, dynamic> jsonData) {
    final ConditionalOperator conditionalOperator;
    switch(jsonData['opt']){
      case '==':
        conditionalOperator = ConditionalOperator.equal;
        break;
      case'>': //TODO: check if this ic correct
        conditionalOperator = ConditionalOperator.greater;
        break;
      case '<'://TODO: check if this ic correct
        conditionalOperator = ConditionalOperator.smaller;
        break;
        default:
          conditionalOperator = ConditionalOperator.equal;
          break;
    }

    return Condition(operator: conditionalOperator, variableName: jsonData['var'] , value: jsonData['val']);

  }

  @override
  String toString()=> '{ $variableName $operator $value }';
}