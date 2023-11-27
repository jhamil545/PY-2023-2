import 'dart:async';

import 'package:asistencia_app/modelo/FincaModelo.dart';
import 'package:asistencia_app/repository/FincaRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'finca_event.dart';

part 'finca_state.dart';

class FincaBloc extends Bloc<FincaEvent, FincaState> {
  late final FincaRepository fincaRepository;
  FincaBloc(this.fincaRepository) : super(FincaInitialState()) {
    on<FincaEvent>((event, emit) async {
      print("Bloc x");
      if (event is ListarFincaEvent) {
        emit(FincaLoadingState());
        try {
          print("pasox!!");
          List<FincaxModelo> fincaList =
          await fincaRepository.getFinca();
              emit(FincaLoadedState(fincaList));
        } catch (e) {
          emit(FincaError(e as Error));
        }
      } else if (event is DeleteFincaEvent) {
        try {
          await fincaRepository.deleteFinca(event.finca!);

          emit(FincaLoadingState());
          print("llegaccc");
          List<FincaxModelo> fincaList = await fincaRepository.getFinca();
          print("no pasasdd");
          emit(FincaLoadedState(fincaList));
        } catch (e) {
          emit(FincaError(e as Error));
        }
      } else if (event is CreateFincaEvent) {
        try {
          await fincaRepository.createFinca(event.finca);
          print("x aquiii");
          emit(FincaLoadingState());
          print("x aquiii");
          List<FincaxModelo> fincaList =
          await fincaRepository.getFinca();

          emit(FincaLoadedState(fincaList));
        } catch (e) {
          emit(FincaError(e as Error));

        }
      } else if (event is UpdateFincaEvent) {
        try {
          await fincaRepository.updateFinca(
              event.finca.id, event.finca);
          emit(FincaLoadingState());
          List<FincaxModelo> fincaList =
          await fincaRepository.getFinca();
          emit(FincaLoadedState(fincaList));
        } catch (e) {
          emit(FincaError(e as Error));
        }
      }
    });
  }
}
