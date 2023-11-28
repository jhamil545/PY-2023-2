part of 'pasto_bloc.dart';

@immutable
abstract class PastoState {}

class PastoInitialState extends PastoState {}

class PastoLoadingState extends PastoState {}

class PastoLoadedState extends PastoState {
  List<PastoModelo> PastoList;
  PastoLoadedState(this.PastoList);
}

class PastoError extends PastoState {
  Error e;
  PastoError(this.e);
}
