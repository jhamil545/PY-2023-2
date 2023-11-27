import 'package:asistencia_app/modelo/PastoModelo.dart';
import 'package:asistencia_app/repository/PastoRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pasto_event.dart';
part 'pasto_state.dart';

class PastoBloc extends Bloc<PastoEvent, PastoState> {
  late final PastoRepository _PastoRepository;
  PastoBloc(this._PastoRepository) : super(PastoInitialState()) {
    on<PastoEvent>((event, emit) async {
      // TODO: implement event handler
      print("Bloc x");
      if (event is ListarPastoEvent) {
        emit(PastoLoadingState());
        try {
          print("pasox!!");
          List<PastoModelo> PersonaList = await _PastoRepository.getPasto();
          emit(PastoLoadedState(PersonaList));
        } catch (e) {
          emit(PastoError(e as Error));
        }
      } else if (event is DeletePastoEvent) {
        try {
          await _PastoRepository.deletePasto(event.Pasto!.id);
          emit(PastoLoadingState());
          List<PastoModelo> PersonaList = await _PastoRepository.getPasto();
          emit(PastoLoadedState(PersonaList));
        } catch (e) {
          emit(PastoError(e as Error));
        }
      } else if (event is CreatePastoEvent) {
        try {
          await _PastoRepository.createPasto(event.Pasto!);
          emit(PastoLoadingState());
          List<PastoModelo> PersonaList = await _PastoRepository.getPasto();
          emit(PastoLoadedState(PersonaList));
        } catch (e) {
          emit(PastoError(e as Error));
        }
      } else if (event is UpdatePastoEvent) {
        try {
          await _PastoRepository.updatePasto(event.Pasto!.id, event.Pasto!);
          emit(PastoLoadingState());
          List<PastoModelo> PersonaList = await _PastoRepository.getPasto();
          emit(PastoLoadedState(PersonaList));
        } catch (e) {
          emit(PastoError(e as Error));
        }
      }
    });
  }
}
