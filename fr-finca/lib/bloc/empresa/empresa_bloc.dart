import 'dart:async';

import 'package:asistencia_app/modelo/EmpresaModelo.dart';
import 'package:asistencia_app/repository/EmpresaRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'empresa_event.dart';

part 'empresa_state.dart';

class EmpresaBloc extends Bloc<EmpresaEvent, EmpresaState> {
  late final EmpresaRepository _empresaRepository;

  EmpresaBloc(this._empresaRepository) : super(EmpresaInitialState()) {
    on<EmpresaEvent>((event, emit) async {
      // TODO: implement event handler
      print("Bloc x");
      if (event is ListarEmpresaEvent) {
        emit(EmpresaLoadingState());
        try {
          print("pasox!!");
          List<EmpresaModelo> PersonaList = await _empresaRepository.getEmpresa();
          emit(EmpresaLoadedState(PersonaList));
        } catch (e) {
          emit(EmpresaError(e as Error));
        }
      } else if (event is DeleteEmpresaEvent) {
        try {
          await _empresaRepository.deleteEmpresa(event.empresa!.id);
          emit(EmpresaLoadingState());
          List<EmpresaModelo> PersonaList = await _empresaRepository.getEmpresa();
          emit(EmpresaLoadedState(PersonaList));
        } catch (e) {
          emit(EmpresaError(e as Error));
        }
      } else if (event is CreateEmpresaEvent) {
        try {
          await _empresaRepository.createEmpresa(event.empresa!);
          emit(EmpresaLoadingState());
          List<EmpresaModelo> PersonaList = await _empresaRepository.getEmpresa();
          emit(EmpresaLoadedState(PersonaList));
        } catch (e) {
          emit(EmpresaError(e as Error));
        }
      } else if (event is UpdateEmpresaEvent) {
        try {
          await _empresaRepository.updateEmpresa(event.empresa!.id, event.empresa!);
          emit(EmpresaLoadingState());
          List<EmpresaModelo> PersonaList = await _empresaRepository.getEmpresa();
          emit(EmpresaLoadedState(PersonaList));
        } catch (e) {
          emit(EmpresaError(e as Error));
        }
      }
    });
  }
}
