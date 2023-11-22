import 'dart:async';

import 'package:asistencia_app/modelo/GanadoModelo.dart';
import 'package:asistencia_app/repository/GanadoRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ganado_event.dart';

part 'ganado_state.dart';

class GanadoBloc extends Bloc<GanadoEvent, GanadoState> {
  late final GanadoRepository _ganadoRepository;

  GanadoBloc(this._ganadoRepository) : super(GanadoInitialState()) {
    on<GanadoEvent>((event, emit) async {
      // TODO: implement event handler
      print("Bloc x");
      if (event is ListarGanadoEvent) {
        emit(GanadoLoadingState());
        try {
          print("pasox!!");
          List<GanadoModelox> PersonaList = await _ganadoRepository.getGanado();
          emit(GanadoLoadedState(PersonaList));
        } catch (e) {
          emit(GanadoError(e as Error));
        }
      } else if (event is DeleteGanadoEvent) {
        try {
          await _ganadoRepository.deleteGanado(event.ganado);
          emit(GanadoLoadingState());
          List<GanadoModelox> PersonaList = await _ganadoRepository.getGanado();
          emit(GanadoLoadedState(PersonaList));
        } catch (e) {
          emit(GanadoError(e as Error));
        }
      } else if (event is CreateGanadoEvent) {
        try {
          await _ganadoRepository.createGanado(event.ganado!);
          emit(GanadoLoadingState());
          List<GanadoModelox> PersonaList = await _ganadoRepository.getGanado();
          emit(GanadoLoadedState(PersonaList));
        } catch (e) {
          emit(GanadoError(e as Error));
        }
      } else if (event is UpdateGanadoEvent) {
        try {
          await _ganadoRepository.updateGanado(event.ganado!.id, event.ganado!);
          emit(GanadoLoadingState());
          List<GanadoModelox> PersonaList = await _ganadoRepository.getGanado();
          emit(GanadoLoadedState(PersonaList));
        } catch (e) {
          emit(GanadoError(e as Error));
        }
      }
    });
  }
}
