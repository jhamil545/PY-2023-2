package pe.edu.upeu.milkminder.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import pe.edu.upeu.milkminder.dtos.LecheDto;
import pe.edu.upeu.milkminder.exceptions.AppException;
import pe.edu.upeu.milkminder.exceptions.ResourceNotFoundException;
import pe.edu.upeu.milkminder.mappers.LecheMapper;
import pe.edu.upeu.milkminder.models.Leche;
import pe.edu.upeu.milkminder.repositories.LecheRepository;

@RequiredArgsConstructor 
@Service
@Transactional
public class LecheServiceImp implements LecheService{

    @Autowired
    private LecheRepository lecheRepository;
    
    @Autowired
    private GanadoService ganadoService;
    
    private final LecheMapper lecheMapper;
    
    @Override
    public Leche save(LecheDto.LecheCrearDto entidad) {
        Leche varEnt=lecheMapper.lecheCrearDtoToLeche(entidad);
        varEnt.setGanadoId(ganadoService.getGanadoById(entidad.ganadoId()));

        try {
            return lecheRepository.save(varEnt);
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public List<Leche> findAll() {
            try {
            return lecheRepository.findAll();
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public Map<String, Boolean> delete(Long id) {
        Leche entidadx = lecheRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Materialesx not exist with id :" + id));

        lecheRepository.delete(entidadx);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", true);

        return response;       
    }

    @Override
    public Leche getLecheById(Long id) {
        Leche findEntidad = lecheRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Materialesx not exist with id :" + id));
        return findEntidad;        
    }

    @Override
    public Leche update(LecheDto.LecheCrearDto entidad, Long id) {
        Leche entidadx = lecheRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Periodo not exist with id :" + id));
        entidadx.setFecha(entidad.fecha());
        entidadx.setTurno(entidad.turno());
        return lecheRepository.save(entidadx);        
    }
    
}