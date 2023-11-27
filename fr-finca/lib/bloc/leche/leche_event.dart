part of 'leche_bloc.dart';

@immutable
abstract class LecheEvent {}

class ListarLecheEvent extends LecheEvent {
  ListarLecheEvent() {
    print("Evento si");
  }
//ListarEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}

class DeleteLecheEvent extends LecheEvent {
  int leche;
  DeleteLecheEvent(this.leche);
//DeleteEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}

class UpdateLecheEvent extends LecheEvent {
  LecheModelo leche;
  UpdateLecheEvent(this.leche);
//UpdateEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}

class CreateLecheEvent extends LecheEvent {
  LecheModelo leche;
  CreateLecheEvent(this.leche);
//CreateEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}
