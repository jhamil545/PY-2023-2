package pe.edu.upeu.milkminder.services;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.edu.upeu.milkminder.exceptions.AppException;

import pe.edu.upeu.milkminder.exceptions.ResourceNotFoundException;

import pe.edu.upeu.milkminder.models.Pasto;
import pe.edu.upeu.milkminder.repositories.PastoRepository;


@RequiredArgsConstructor
@Service
@Transactional
public class PastoServiceImp implements PastoService{

    @Autowired
    private PastoRepository PastoRepo;


    
    @Override
    public Pasto save(Pasto Pasto) {
        
        try {
            return PastoRepo.save(Pasto);
        } catch (Exception e) {
            throw new AppException("Error-"+e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public List<Pasto> findAll() {
        try {
            return PastoRepo.findAll();
        } catch (Exception e) {
            throw new AppException("Error-"+e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public Map<String, Boolean> delete(Long id) {
        Pasto Pastox = PastoRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Actividad not exist with id :" + id));

        PastoRepo.delete(Pastox);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", true);

        return response;        
    }

    @Override
    public Pasto getPastoById(Long id) {
        Pasto findPasto = PastoRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Activiad not exist with id :" + id));
        return findPasto;        
    }

    @Override
    public Pasto update(Pasto Pasto, Long id) {
        Pasto Pastox = PastoRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Periodo not exist with id :" + id));
        Pastox.setEspeciepasto(Pasto.getEspeciepasto());
        
        return PastoRepo.save(Pastox);        
    }
    
}
