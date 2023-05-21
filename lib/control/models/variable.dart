enum VariableType { string, int, bool, double }

abstract class Variable {
  Variable({required this.name, this.type = VariableType.int, value});

  final String name;
  final VariableType type;



}
