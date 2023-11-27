package pe.edu.upeu.milkminder.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.edu.upeu.milkminder.models.Control;
import pe.edu.upeu.milkminder.repositories.ControlRepository;
@Service


public class ControlServiceImp implements ControlService{
    @Autowired
    private ControlRepository controlRepository;

    @Override
    public Control actualizar(Control control) {
        // TODO Auto-generated method stub
        return controlRepository.save(control);
    }

    @Override
    public void eliminarPorId(Long id) {
        // TODO Auto-generated method stub
        controlRepository.deleteById(id);
    }

    @Override
    public Control guardar(Control control) {
        // TODO Auto-generated method stub
        return controlRepository.save(control);
    }

    @Override
    public List<Control> listar() {
        // TODO Auto-generated method stub
        return controlRepository.findAll();
    }

    @Override
    public Optional<Control> listarPorId(Long id) {
        // TODO Auto-generated method stub
        return controlRepository.findById(id);
    }

  
    
    
}
