part of 'empresa_bloc.dart';

@immutable
abstract class EmpresaState {}

class EmpresaInitialState extends EmpresaState {}

class EmpresaLoadingState extends EmpresaState {}

class EmpresaLoadedState extends EmpresaState {
  List<EmpresaModelo> EmpresaList;

  EmpresaLoadedState(this.EmpresaList);
}

class EmpresaError extends EmpresaState {
  Error e;

  EmpresaError(this.e);
}
