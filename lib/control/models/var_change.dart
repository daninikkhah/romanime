enum Operator { add, subtract, multiply, divide, equals }

class VarChange {
  VarChange(
      {required this.operator,
      required this.variableName,
      required this.value});

  final Operator operator;
  final String variableName;
  final int value;

  factory VarChange.fromJson(Map<String, dynamic> jsonData) {

    final Operator operator;
    switch (jsonData['opt']) {
      case '=':
        operator = Operator.equals;
        break;
      case '+':
        operator = Operator.add;
        break;
      case '-':
        operator = Operator.subtract;
        break;
      case '*':
        operator = Operator.multiply;
        break;
      case '/':
        operator = Operator.divide;
        break;
      default:
        operator = Operator.equals;
        break;
    }

    return VarChange(
        operator: operator,
        variableName: jsonData['var'],
        value: jsonData['val']);
  }

  @override
  String toString() => '{ $variableName $operator $variableName }';
}
//TODO: should I handle division by 0 here?
