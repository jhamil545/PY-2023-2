package pe.edu.upeu.milkminder.services;

import java.util.List;
import java.util.Map;

import pe.edu.upeu.milkminder.models.Pasto;

public interface PastoService {

    Pasto save(Pasto pasto);

    List<Pasto> findAll();

    Map<String, Boolean> delete(Long id);

    Pasto getPastoById(Long id);

    Pasto update(Pasto pasto, Long id);     

    
}
