package pe.edu.upeu.milkminder.services;


import java.util.List;
import java.util.Map;

import pe.edu.upeu.milkminder.dtos.LecheDto;

import pe.edu.upeu.milkminder.models.Leche;

public interface LecheService {
    Leche save(LecheDto.LecheCrearDto entidad);

    List<Leche> findAll();

    Map<String, Boolean> delete(Long id);

    Leche getLecheById(Long id);

    Leche update(LecheDto.LecheCrearDto entidad, Long id);     
}