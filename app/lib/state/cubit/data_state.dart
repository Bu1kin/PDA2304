import 'package:app/model/finance.dart';

abstract class DataState {
  const DataState();
}

class InitialState extends DataState {}

class ErrorState extends DataState {
  final String message;
  ErrorState(this.message);
}

class SuccessState extends DataState {
  SuccessState(this.finances);
  late List<Finance> finances;
}