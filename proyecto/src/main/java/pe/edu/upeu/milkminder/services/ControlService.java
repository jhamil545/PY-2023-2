package pe.edu.upeu.milkminder.services;
import java.util.List;
import java.util.Optional;

import pe.edu.upeu.milkminder.models.Control;

public interface ControlService {
    public List<Control> listar();

    public Control guardar(Control control);

    public Control actualizar(Control control);

    public Optional<Control> listarPorId(Long id);

    public void eliminarPorId(Long id); 
}