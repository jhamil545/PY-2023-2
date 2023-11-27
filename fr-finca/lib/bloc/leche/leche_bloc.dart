import 'dart:async';

import 'package:asistencia_app/modelo/LecheModelo.dart';
import 'package:asistencia_app/repository/LecheRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'leche_event.dart';

part 'leche_state.dart';

class LecheBloc extends Bloc<LecheEvent, LecheState> {
  late final LecheRepository lecheRepository;
  LecheBloc(this.lecheRepository) : super(LecheInitialState()) {
    on<LecheEvent>((event, emit) async {
      print("Bloc x");
      if (event is ListarLecheEvent) {
        emit(LecheLoadingState());
        try {
          print("pasox!!");
          List<LechexModelo> lecheList =
          await lecheRepository.getLeche();
          emit(LecheLoadedState(lecheList));
        } catch (e) {
          emit(LecheError(e as Error));
        }
      } else if (event is DeleteLecheEvent) {
        try {
          await lecheRepository.deleteLeche(event.leche!);

          emit(LecheLoadingState());
          print("llegaccc");
          List<LechexModelo> lecheList = await lecheRepository.getLeche();
          print("no pasasdd");
          emit(LecheLoadedState(lecheList));
        } catch (e) {
          emit(LecheError(e as Error));
        }
      } else if (event is CreateLecheEvent) {
        try {
          await lecheRepository.createLeche(event.leche);
          print("x aquiii");
          emit(LecheLoadingState());
          print("x aquiii");
          List<LechexModelo> lecheList =
          await lecheRepository.getLeche();

          emit(LecheLoadedState(lecheList));
        } catch (e) {
          emit(LecheError(e as Error));

        }
      } else if (event is UpdateLecheEvent) {
        try {
          await lecheRepository.updateLeche(
              event.leche.id, event.leche);
          emit(LecheLoadingState());
          List<LechexModelo> lecheList =
          await lecheRepository.getLeche();
          emit(LecheLoadedState(lecheList));
        } catch (e) {
          emit(LecheError(e as Error));
        }
      }
    });
  }
}
