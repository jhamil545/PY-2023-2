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

import pe.edu.upeu.milkminder.models.Raza;
import pe.edu.upeu.milkminder.repositories.RazaRepository;


@RequiredArgsConstructor
@Service
@Transactional
public class RazaServiceImp implements RazaService{

    @Autowired
    private RazaRepository razaRepo;


    
    @Override
    public Raza save(Raza raza) {
        
        try {
            return razaRepo.save(raza);
        } catch (Exception e) {
            throw new AppException("Error-"+e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public List<Raza> findAll() {
        try {
            return razaRepo.findAll();
        } catch (Exception e) {
            throw new AppException("Error-"+e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public Map<String, Boolean> delete(Long id) {
        Raza razax = razaRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Actividad not exist with id :" + id));

        razaRepo.delete(razax);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", true);

        return response;        
    }

    @Override
    public Raza getRazaById(Long id) {
        Raza findRaza = razaRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Activiad not exist with id :" + id));
        return findRaza;        
    }

    @Override
    public Raza update(Raza raza, Long id) {
        Raza razax = razaRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Periodo not exist with id :" + id));
        razax.setNombreRaza(raza.getNombreRaza());
        
        return razaRepo.save(razax);        
    }
    
}
