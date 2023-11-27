package pe.edu.upeu.milkminder.services;


import java.util.List;
import java.util.Map;

import pe.edu.upeu.milkminder.dtos.GanadoDto;
import pe.edu.upeu.milkminder.models.Ganado;

public interface GanadoService {
    Ganado save(GanadoDto.GanadoCrearDto entidad);

    List<Ganado> findAll();

    Map<String, Boolean> delete(Long id);

    Ganado getGanadoById(Long id);

    Ganado update(GanadoDto.GanadoCrearDto entidad, Long id);     
}
