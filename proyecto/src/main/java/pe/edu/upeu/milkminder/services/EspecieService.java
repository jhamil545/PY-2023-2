package pe.edu.upeu.milkminder.services;
import java.util.List;
import java.util.Map;
import pe.edu.upeu.milkminder.models.Especie;

public interface EspecieService {
      Especie save(Especie especie);

    List<Especie> findAll();

    Map<String, Boolean> delete(Long id);

    Especie getEspecieById(Long id);

    Especie update(Especie especie, Long id);     
}
