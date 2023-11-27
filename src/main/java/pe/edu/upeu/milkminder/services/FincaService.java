package pe.edu.upeu.milkminder.services;
import java.util.List;
import java.util.Map;

import pe.edu.upeu.milkminder.dtos.FincaDto;
import pe.edu.upeu.milkminder.models.Finca;

public interface FincaService {
    Finca save(FincaDto.FincaCrearDto entidad);

    List<Finca> findAll();

    Map<String, Boolean> delete(Long id);

    Finca getFincaById(Long id);

    Finca update(FincaDto.FincaCrearDto entidad, Long id);     
}