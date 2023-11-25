part of 'raza_bloc.dart';

@immutable
abstract class RazaEvent {}
class ListarRazaEvent extends RazaEvent{
  ListarRazaEvent(){print("Evento si");}
//ListarRazaEvent({required RazaModelo raza}):super(raza:raza);
}
class DeleteRazaEvent extends RazaEvent{
  RazaModelo raza;
  DeleteRazaEvent(this.raza);
//DeleteRazaEvent({required RazaModelo raza}):super(raza:raza);
}
class UpdateRazaEvent extends RazaEvent{
  RazaModelo raza;
  UpdateRazaEvent(this.raza);
//UpdateRazaEvent({required RazaModelo raza}):super(raza:raza);
}
class CreateRazaEvent extends RazaEvent{
  RazaModelo raza;
  CreateRazaEvent(this.raza);
//CreateRazaEvent({required RazaModelo raza}):super(raza:raza);
}
