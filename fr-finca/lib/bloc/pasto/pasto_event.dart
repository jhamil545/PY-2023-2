part of 'pasto_bloc.dart';

@immutable
abstract class PastoEvent {}

class ListarPastoEvent extends PastoEvent {
  ListarPastoEvent() {
    print("Evento si");
  }
//ListarPastoEvent({required PastoModelo Pasto}):super(Pasto:Pasto);
}

class DeletePastoEvent extends PastoEvent {
  PastoModelo Pasto;
  DeletePastoEvent(this.Pasto);
//DeletePastoEvent({required PastoModelo Pasto}):super(Pasto:Pasto);
}

class UpdatePastoEvent extends PastoEvent {
  PastoModelo Pasto;
  UpdatePastoEvent(this.Pasto);
//UpdatePastoEvent({required PastoModelo Pasto}):super(Pasto:Pasto);
}

class CreatePastoEvent extends PastoEvent {
  PastoModelo Pasto;
  CreatePastoEvent(this.Pasto);
//CreateActividadEvent({required ActividadModelo actividad}):super(actividad:actividad);
}
