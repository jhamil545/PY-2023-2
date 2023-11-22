package pe.edu.upeu.milkminder.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import pe.edu.upeu.milkminder.dtos.FincaDto;
import pe.edu.upeu.milkminder.exceptions.AppException;
import pe.edu.upeu.milkminder.exceptions.ResourceNotFoundException;
import pe.edu.upeu.milkminder.mappers.FincaMapper;
import pe.edu.upeu.milkminder.models.Finca;
import pe.edu.upeu.milkminder.repositories.FincaRepository;


@RequiredArgsConstructor 
@Service
@Transactional
public class FincaServiceImp implements FincaService{

    @Autowired
    private FincaRepository fincaRepository;
    
    @Autowired
    private GanadoService ganadoService;
    
    private final FincaMapper fincaMapper;
    
    @Override
    public Finca save(FincaDto.FincaCrearDto entidad) {
        Finca varEnt=fincaMapper.fincaCrearDtoToFinca(entidad);
        varEnt.setGanadoId(ganadoService.getGanadoById(entidad.ganadoId()));

        try {
            return fincaRepository.save(varEnt);
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public List<Finca> findAll() {
            try {
            return fincaRepository.findAll();
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public Map<String, Boolean> delete(Long id) {
        Finca entidadx = fincaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Materialesx not exist with id :" + id));

        fincaRepository.delete(entidadx);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", true);

        return response;       
    }

    @Override
    public Finca getFincaById(Long id) {
        Finca findEntidad = fincaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Materialesx not exist with id :" + id));
        return findEntidad;        
    }

    @Override
    public Finca update(FincaDto.FincaCrearDto entidad, Long id) {
        Finca entidadx = fincaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Periodo not exist with id :" + id));
        entidadx.setNombre(entidad.nombre());
        return fincaRepository.save(entidadx);        
    }
    
}
