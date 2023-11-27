import 'package:asistencia_app/modelo/EspecieModelo.dart';
import 'package:asistencia_app/repository/EspecieRespository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'especie_event.dart';
part 'especie_state.dart';

class EspecieBloc extends Bloc<EspecieEvent, EspecieState> {
  late final EspecieRepository _especieRepository;
  EspecieBloc(this._especieRepository) : super(EspecieInitialState()) {
    on<EspecieEvent>((event, emit) async {
      // TODO: implement event handler
      print("Bloc x");
      if (event is ListarEspecieEvent) {
        emit(EspecieLoadingState());
        try {
          print("pasox!!");
          List<EspecieModelo> PersonaList =
              await _especieRepository.getEspecie();
          emit(EspecieLoadedState(PersonaList));
        } catch (e) {
          emit(EspecieError(e as Error));
        }
      } else if (event is DeleteEspecieEvent) {
        try {
          await _especieRepository.deleteEspecie(event.especie!.id);
          emit(EspecieLoadingState());
          List<EspecieModelo> PersonaList =
              await _especieRepository.getEspecie();
          emit(EspecieLoadedState(PersonaList));
        } catch (e) {
          emit(EspecieError(e as Error));
        }
      } else if (event is CreateEspecieEvent) {
        try {
          await _especieRepository.createEspecie(event.especie!);
          emit(EspecieLoadingState());
          List<EspecieModelo> PersonaList =
              await _especieRepository.getEspecie();
          emit(EspecieLoadedState(PersonaList));
        } catch (e) {
          emit(EspecieError(e as Error));
        }
      } else if (event is UpdateEspecieEvent) {
        try {
          await _especieRepository.updateEspecie(
              event.especie!.id, event.especie!);
          emit(EspecieLoadingState());
          List<EspecieModelo> PersonaList =
              await _especieRepository.getEspecie();
          emit(EspecieLoadedState(PersonaList));
        } catch (e) {
          emit(EspecieError(e as Error));
        }
      }
    });
  }
}
