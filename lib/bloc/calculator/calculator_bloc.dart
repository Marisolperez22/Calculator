import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<ResetAC>(_onResetAC);
    on<AddNumber>(_onAddNumber);
    on<ChangeNegativePositive>(_onChangeNegativePositive);
    on<DeleteLastEntry>(_onDeleteLastEntry);
    on<OperationEntry>(_onOperationEntry);
    on<CalculateResult>(_onCalculateResult);
  }
  //Borrar todo
  void _onResetAC(ResetAC event, Emitter emit) {
    emit(state.copyWith(
      firstNumber: '0',
      mathResult: '0',
      secondNumber: '0',
      operation: '',
    ));
  }

  //Agregar números
  void _onAddNumber(AddNumber event, Emitter emit) {
    emit(state.copyWith(
      mathResult: state.mathResult == '0'
          ? event.number
          : state.mathResult + event.number,
    ));
  }

  //Cambiar signo de positivo a negativo o viceversa
  void _onChangeNegativePositive(ChangeNegativePositive event, Emitter emit) {
    emit(state.copyWith(
        mathResult: state.mathResult.contains('-')
            ? state.mathResult.replaceFirst(('-'), '')
            : '-${state.mathResult}'));
  }

  //Borrar últimos dígitos
  void _onDeleteLastEntry(DeleteLastEntry event, Emitter emit) {
    emit(state.copyWith(
        mathResult: state.mathResult.length > 1
            ? state.mathResult.substring(0, state.mathResult.length - 1)
            : '0'));
  }

  //Hacer operación
  void _onOperationEntry(OperationEntry event, Emitter emit) {
    emit(state.copyWith(
        firstNumber: state.mathResult,
        mathResult: '0',
        operation: event.operation,
        secondNumber: '0'));
  }

  //Calcular resultado
  void _onCalculateResult(CalculateResult event, Emitter emit) {
    final double num1 = double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResult);

    switch (state.operation) {
      case '+':
        emit(state.copyWith(
            secondNumber: state.mathResult, mathResult: '${num1 + num2}'));
        break;

      case '-':
        emit(state.copyWith(
            secondNumber: state.mathResult, mathResult: '${num1 - num2}'));
        break;
      case '*':
        emit(state.copyWith(
            secondNumber: state.mathResult, mathResult: '${num1 * num2}'));
        break;
      case '/':
        emit(state.copyWith(
            secondNumber: state.mathResult, mathResult: '${num1 / num2}'));
        break;

      default:
        state;
    }
  }
}
