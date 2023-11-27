part of 'empresa_bloc.dart';

@immutable
abstract class EmpresaEvent {}

class ListarEmpresaEvent extends EmpresaEvent {
  ListarEmpresaEvent() {
    print("Evento si");
  }
//ListarEmpresaEvent({required EmpresaModelo empresa}):super(empresa:empresa);
}

class DeleteEmpresaEvent extends EmpresaEvent {
  EmpresaModelo empresa;

  DeleteEmpresaEvent(this.empresa);
//DeleteEmpresaEvent({required EmpresaModelo empresa}):super(empresa:empresa);
}

class UpdateEmpresaEvent extends EmpresaEvent {
  EmpresaModelo empresa;

  UpdateEmpresaEvent(this.empresa);
//UpdateEmpresaEvent({required EmpresaaModelo empresa}):super(empresa:empresa);
}

class CreateEmpresaEvent extends EmpresaEvent {
  EmpresaModelo empresa;

  CreateEmpresaEvent(this.empresa);
//CreateEmpresaEvent({required EmpresaModelo empresa}):super(empresa:empresa);
}
