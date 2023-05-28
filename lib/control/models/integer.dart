import 'variable.dart';
import 'var_change.dart';

class Integer extends Variable {
  Integer({required super.name, this.value = 0});

  int value;

  @override
  bool isEqualTo(Variable variable) {
    if (variable.type == VariableType.int) {
      Integer integerVariable = variable as Integer;
      if (value == integerVariable.value) {
        return true;
      }
    }
    return false;
  }

  @override
  bool isGreaterThan(Variable variable) {
    if (variable.type == VariableType.int) {
      Integer integerVariable = variable as Integer;
      if (value > integerVariable.value) {
        return true;
      }
    }
    return false;
  }

  @override
  bool isSmallerThan(Variable variable) {
    if (variable.type == VariableType.int) {
      Integer integerVariable = variable as Integer;
      if (value < integerVariable.value) {
        return true;
      }
    }
    return false;
  }

  void change(VarChange varChange) {
    if (varChange.variableName != name) {
      return; // TODO: throw exception
    }
    switch (varChange.operator) {
      case Operator.equals:
        value = varChange.value;
        break;
      case Operator.add:
        value += varChange.value;
        break;
      case Operator.subtract:
        value -= varChange.value;
        break;
      case Operator.multiply:
        value *= varChange.value;
        break;
      case Operator.divide:
        value = (value / varChange.value).round();
        break;
      default:
        value = varChange.value;
        break; // TODO: throw error
    }
  }

  @override
  toString() => '{ name: $name, type: $type, value: $value }';
}
