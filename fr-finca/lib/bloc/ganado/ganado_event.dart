part of 'ganado_bloc.dart';

@immutable
abstract class GanadoEvent {}

class ListarGanadoEvent extends GanadoEvent {
  ListarRazaEvent() {
    print("Evento si");
  }
//ListarRazaEvent({required RazaModelo raza}):super(raza:raza);
}

class DeleteGanadoEvent extends GanadoEvent {
  int ganado;

  DeleteGanadoEvent(this.ganado);
//DeleteRazaEvent({required RazaModelo raza}):super(raza:raza);
}

class UpdateGanadoEvent extends GanadoEvent {



GanadoModelo ganado;
UpdateGanadoEvent(this.ganado);
//UpdateRazaEvent({required RazaModelo raza}):super(raza:raza);
}

class CreateGanadoEvent extends GanadoEvent {

  GanadoModelo ganado;
  CreateGanadoEvent(this.ganado);
//CreateRazaEvent({required RazaModelo raza}):super(raza:raza);
}
