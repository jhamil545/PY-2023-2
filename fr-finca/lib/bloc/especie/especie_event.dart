part of 'especie_bloc.dart';

@immutable
abstract class EspecieEvent {}

class ListarEspecieEvent extends EspecieEvent {
  ListarEspecieEvent() {
    print("Evento si");
  }
//ListarEspecieEvent({required EspecieModelo Especie}):super(Especie:Especie);
}

class DeleteEspecieEvent extends EspecieEvent {
  EspecieModelo especie;
  DeleteEspecieEvent(this.especie);
//DeleteEspecieEvent({required EspecieModelo Especie}):super(Especie:Especie);
}

class UpdateEspecieEvent extends EspecieEvent {
  EspecieModelo especie;
  UpdateEspecieEvent(this.especie);
//UpdateEspecieEvent({required EspecieModelo Especie}):super(Especie:Especie);
}

class CreateEspecieEvent extends EspecieEvent {
  EspecieModelo especie;
  CreateEspecieEvent(this.especie);
//CreateActividadEvent({required ActividadModelo actividad}):super(actividad:actividad);
}
