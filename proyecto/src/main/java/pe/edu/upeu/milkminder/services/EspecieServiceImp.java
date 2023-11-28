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

import pe.edu.upeu.milkminder.models.Especie;
import pe.edu.upeu.milkminder.repositories.EspecieRepository;


@RequiredArgsConstructor
@Service
@Transactional
public class EspecieServiceImp implements EspecieService{

    @Autowired
    private EspecieRepository EspecieRepo;


    
    @Override
    public Especie save(Especie especie) {
        
        try {
            return EspecieRepo.save(especie);
        } catch (Exception e) {
            throw new AppException("Error-"+e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public List<Especie> findAll() {
        try {
            return EspecieRepo.findAll();
        } catch (Exception e) {
            throw new AppException("Error-"+e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public Map<String, Boolean> delete(Long id) {
        Especie Especiex = EspecieRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Actividad not exist with id :" + id));

        EspecieRepo.delete(Especiex);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", true);

        return response;        
    }

    @Override
    public Especie getEspecieById(Long id) {
        Especie findEspecie = EspecieRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Activiad not exist with id :" + id));
        return findEspecie;        
    }

    @Override
    public Especie update(Especie Especie, Long id) {
        Especie Especiex = EspecieRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Periodo not exist with id :" + id));
        Especiex.setTipo(Especie.getTipo());
        
        return EspecieRepo.save(Especiex);        
    }
    
}
