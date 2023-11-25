package pe.edu.upeu.milkminder.services;

import java.util.List;
import java.util.Map;

import pe.edu.upeu.milkminder.dtos.EmpresaDto;
import pe.edu.upeu.milkminder.models.Empresa;

public interface EmpresaService {
    Empresa save(EmpresaDto.EmpresaCrearDto entidad);

    List<Empresa> findAll();

    Map<String, Boolean> delete(Long id);

    Empresa getEmpresaById(Long id);

    Empresa update(EmpresaDto.EmpresaCrearDto entidad, Long id);     
}
