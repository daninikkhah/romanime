import 'integer.dart';
enum VariableType { string, int, bool, double }

abstract class Variable {
  Variable({required this.name, this.type = VariableType.int, value});

  final String name;
  final VariableType type;

  factory Variable.fromJson({required String name,required String type,required dynamic value}) => Integer(name: name, value: value);


}
