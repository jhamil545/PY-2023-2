part of 'leche_bloc.dart';

@immutable
abstract class LecheState {}

class LecheInitialState extends LecheState {}

class LecheLoadingState extends LecheState {}

class LecheLoadedState extends LecheState {
  List<LechexModelo> lecheList;
  LecheLoadedState(this.lecheList);
}

class LecheError extends LecheState {
  Error e;
  LecheError(this.e);
}
