package pe.edu.upeu.milkminder.services;
import java.util.List;
import java.util.Map;

import pe.edu.upeu.milkminder.dtos.EmpresaDto;
import pe.edu.upeu.milkminder.models.Control;

public interface ControlService {
    Control save(EmpresaDto.EmpresaCrearDto entidad);

    List<Control> findAll();

    Map<String, Boolean> delete(Long id);

    Control getControlById(Long id);

    Control update(EmpresaDto.EmpresaCrearDto entidad, Long id);     
}