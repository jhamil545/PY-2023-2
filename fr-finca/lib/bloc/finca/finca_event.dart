part of 'finca_bloc.dart';

@immutable
abstract class FincaEvent {}

class ListarFincaEvent extends FincaEvent {
  ListarFincaEvent() {
    print("Evento si");
  }
//ListarEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}

class DeleteFincaEvent extends FincaEvent {
  int finca;
  DeleteFincaEvent(this.finca);
//DeleteEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}

class UpdateFincaEvent extends FincaEvent {
  FincaModelo finca;
  UpdateFincaEvent(this.finca);
//UpdateEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}

class CreateFincaEvent extends FincaEvent {
  FincaModelo finca;
  CreateFincaEvent(this.finca);
//CreateEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}
