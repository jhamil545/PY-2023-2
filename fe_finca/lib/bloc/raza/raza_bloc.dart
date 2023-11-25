import 'dart:async';

import 'package:asistencia_app/modelo/RazaModelo.dart';
import 'package:asistencia_app/repository/RazaRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'raza_event.dart';
part 'raza_state.dart';

class RazaBloc extends Bloc<RazaEvent, RazaState> {
  late final RazaRepository _razaRepository;
  RazaBloc(this._razaRepository) : super(RazaInitialState()) {
    on<RazaEvent>((event, emit) async{
      // TODO: implement event handler
      print("Bloc x");
      if(event is ListarRazaEvent){
        emit(RazaLoadingState());
        try{
          print("pasox!!");
          List<RazaModelo> PersonaList= await _razaRepository.getRaza();
          emit(RazaLoadedState(PersonaList));
        } catch(e){
          emit(RazaError(e as Error)) ;
        }
      }else if(event is DeleteRazaEvent){
        try{
          await _razaRepository.deleteRaza(event.raza!.id);
          emit(RazaLoadingState());
          List<RazaModelo> PersonaList= await _razaRepository.getRaza();
          emit(RazaLoadedState(PersonaList));
        }catch(e){
          emit(RazaError(e as Error));
        }
      }else if(event is CreateRazaEvent){
        try{
          await _razaRepository.createRaza(event.raza!);
          emit(RazaLoadingState());
          List<RazaModelo> PersonaList= await _razaRepository.getRaza();
          emit(RazaLoadedState(PersonaList));
        }catch(e){
          emit(RazaError(e as Error));
        }
      }else if(event is UpdateRazaEvent){
        try{
          await _razaRepository.updateRaza(event.raza!.id, event.raza!);
          emit(RazaLoadingState());
          List<RazaModelo> PersonaList= await _razaRepository.getRaza();
          emit(RazaLoadedState(PersonaList));
        }catch(e){
          emit(RazaError(e as Error));
        }
      }
    });
  }
}
