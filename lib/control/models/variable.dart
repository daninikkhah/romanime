import 'integer.dart';
import 'var_change.dart';
enum VariableType { string, int, bool, double }

abstract class Variable {
  Variable({required this.name, this.type = VariableType.int});

  final String name;
  final VariableType type;

  factory Variable.fromJson({required String name, String type ='int',required dynamic value}) => Integer(name: name, value: value);

  bool isEqualTo(Variable variable);
  bool isGreaterThan(Variable variable);
  bool isSmallerThan(Variable variable);

  void applyVarChange(VarChange varChange);

}
