part of 'ganado_bloc.dart';

@immutable
abstract class GanadoState {}

class GanadoInitialState extends GanadoState {}

class GanadoLoadingState extends GanadoState {}

class GanadoLoadedState extends GanadoState {
  List<GanadoModelox> ganadoList;

  GanadoLoadedState(this.ganadoList);
}

class GanadoError extends GanadoState {
  Error e;

  GanadoError(this.e);
}
