part of 'ganado_bloc.dart';

@immutable
abstract class GanadoEvent {}

class ListarGanadoEvent extends GanadoEvent {
  ListarGanadoEvent() {
    print("Evento si");
  }
//ListarEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}

class DeleteGanadoEvent extends GanadoEvent {
  GanadoModelo ganado;
  DeleteGanadoEvent(this.ganado);
//DeleteEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}

class UpdateGanadoEvent extends GanadoEvent {
  GanadoxModelo ganado;
  UpdateGanadoEvent(this.ganado);
//UpdateEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}

class CreateGanadoEvent extends GanadoEvent {
  GanadoxModelo ganado;
  CreateGanadoEvent(this.ganado);
//CreateEmpresaEvent({required EmpresaModelo Empresa}):super(Empresa:Empresa);
}
