import 'variable.dart';
import 'var_change.dart';

class Integer extends Variable {
  Integer({required super.name, this.value = 0});

  int value;

  void change(VarChange varChange){
    if(varChange.variableName != name) {
      return; // TODO: throw exception
    }
    switch(varChange.operator){
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
        value = (value /varChange.value).round();
        break;
      default:
        value = varChange.value;
        break; // TODO: throw error
    }
  }

  @override
  toString() => '{ name: $name, type: $type, value: $value }';

}