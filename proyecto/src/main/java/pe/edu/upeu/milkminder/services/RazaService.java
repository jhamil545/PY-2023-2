package pe.edu.upeu.milkminder.services;

import java.util.List;
import java.util.Map;

import pe.edu.upeu.milkminder.models.Raza;


public interface RazaService {
     Raza save(Raza raza);

    List<Raza> findAll();

    Map<String, Boolean> delete(Long id);

    Raza getRazaById(Long id);

    Raza update(Raza raza, Long id);   
}
