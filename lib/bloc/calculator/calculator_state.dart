part of 'calculator_bloc.dart';

class CalculatorState extends Equatable {
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operation;

  const CalculatorState(
      {this.mathResult = '40',
      this.firstNumber = '20',
      this.secondNumber = '20',
      this.operation = '+'});

  CalculatorState copyWith({
    String? mathResult,
    String? firstNumber,
    String? secondNumber,
    String? operation,
  }) =>
      CalculatorState(
        mathResult: mathResult ?? this.mathResult,
        firstNumber: firstNumber ?? this.firstNumber,
        secondNumber: secondNumber ?? this.secondNumber,
        operation: operation ?? this.operation,
      );

  @override
  List<Object> get props => [mathResult, firstNumber, secondNumber, operation];
}

class CalculatorInitial extends CalculatorState {}
