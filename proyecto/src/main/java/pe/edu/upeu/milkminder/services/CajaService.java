package pe.edu.upeu.milkminder.services;


import java.util.List;
import java.util.Optional;

import pe.edu.upeu.milkminder.models.Caja;



public interface CajaService {
  public List<Caja> listar();

    public Caja guardar(Caja caja);

    public Caja actualizar(Caja caja);

    public Optional<Caja> listarPorId(Long id);

    public void eliminarPorId(Long id); 


}
