part of 'especie_bloc.dart';

@immutable
abstract class EspecieState {}

class EspecieInitialState extends EspecieState {}

class EspecieLoadingState extends EspecieState {}

class EspecieLoadedState extends EspecieState {
  List<EspecieModelo> EspecieList;
  EspecieLoadedState(this.EspecieList);
}

class EspecieError extends EspecieState {
  Error e;
  EspecieError(this.e);
}
