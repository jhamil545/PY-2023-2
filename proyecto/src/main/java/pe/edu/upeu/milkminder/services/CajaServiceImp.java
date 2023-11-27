package pe.edu.upeu.milkminder.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.edu.upeu.milkminder.models.Caja;
import pe.edu.upeu.milkminder.repositories.CajaRepository;

@Service

public class CajaServiceImp  implements CajaService{
    @Autowired
    private CajaRepository cajaRepository;

    @Override
    public Caja actualizar(Caja caja) {
        // TODO Auto-generated method stub
        return cajaRepository.save(caja);
    }

    @Override
    public void eliminarPorId(Long id) {
        cajaRepository.deleteById(id);
        
    }

    @Override
    public Caja guardar(Caja caja) {
        // TODO Auto-generated method stub
        return cajaRepository.save(caja);
    }

    @Override
    public List<Caja> listar() {
        // TODO Auto-generated method stub
        return cajaRepository.findAll();
    }

    @Override
    public Optional<Caja> listarPorId(Long id) {
        // TODO Auto-generated method stub
        return cajaRepository.findById(id);
    }
    
}
