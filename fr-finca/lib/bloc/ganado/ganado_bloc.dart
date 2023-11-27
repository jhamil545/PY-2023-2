import 'dart:async';

import 'package:asistencia_app/modelo/GanadoModelo.dart';
import 'package:asistencia_app/repository/GanadoRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ganado_event.dart';

part 'ganado_state.dart';

class GanadoBloc extends Bloc<GanadoEvent, GanadoState> {
  late final GanadoRepository ganadoRepository;
  GanadoBloc(this.ganadoRepository) : super(GanadoInitialState()) {
    on<GanadoEvent>((event, emit) async {
      print("Bloc x");
      if (event is ListarGanadoEvent) {
        emit(GanadoLoadingState());
        try {
          print("pasox!!");
          List<GanadoxModelo> ganadoList =
          await ganadoRepository.getGanado();
          emit(GanadoLoadedState(ganadoList));
        } catch (e) {
          emit(GanadoError(e as Error));
        }
      } else if (event is DeleteGanadoEvent) {
        try {
          await ganadoRepository.deleteGanado(event.ganado!);

          emit(GanadoLoadingState());
          print("llegaccc");
          List<GanadoxModelo> ganadoList = await ganadoRepository.getGanado();
          print("no pasasdd");
          emit(GanadoLoadedState(ganadoList));
        } catch (e) {
          emit(GanadoError(e as Error));
        }
      } else if (event is CreateGanadoEvent) {
        try {
          await ganadoRepository.createGanado(event.ganado);
          print("x aquiii");
          emit(GanadoLoadingState());
          print("x aquiii");
          List<GanadoxModelo> ganadoList =
          await ganadoRepository.getGanado();

          emit(GanadoLoadedState(ganadoList));
        } catch (e) {
          emit(GanadoError(e as Error));

        }
      } else if (event is UpdateGanadoEvent) {
        try {
          await ganadoRepository.updateGanado(
              event.ganado.id, event.ganado);
          emit(GanadoLoadingState());
          List<GanadoxModelo> ganadoList =
          await ganadoRepository.getGanado();
          emit(GanadoLoadedState(ganadoList));
        } catch (e) {
          emit(GanadoError(e as Error));
        }
      }
    });
  }
}
