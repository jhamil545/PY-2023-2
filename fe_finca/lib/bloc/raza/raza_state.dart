part of 'raza_bloc.dart';

@immutable
abstract class RazaState {}

class RazaInitialState extends RazaState {}
class RazaLoadingState extends RazaState{}
class RazaLoadedState extends RazaState{
  List<RazaModelo> RazaList;
  RazaLoadedState(this.RazaList);
}
class RazaError extends RazaState{
  Error e;
  RazaError(this.e);
}
