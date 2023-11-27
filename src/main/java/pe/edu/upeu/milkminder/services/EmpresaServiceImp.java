package pe.edu.upeu.milkminder.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import pe.edu.upeu.milkminder.dtos.EmpresaDto;
import pe.edu.upeu.milkminder.exceptions.AppException;
import pe.edu.upeu.milkminder.exceptions.ResourceNotFoundException;
import pe.edu.upeu.milkminder.mappers.EmpresaMapper;
import pe.edu.upeu.milkminder.models.Empresa;
import pe.edu.upeu.milkminder.repositories.EmpresaRepository;



@RequiredArgsConstructor 
@Service
@Transactional
public class EmpresaServiceImp implements EmpresaService{

    @Autowired
    private EmpresaRepository empresaRepository;
    
    @Autowired
    private FincaService fincaService;
    
    private final EmpresaMapper empresaMapper;
    
    @Override
    public Empresa save(EmpresaDto.EmpresaCrearDto entidad) {
        Empresa varEnt=empresaMapper.empresaCrearDtoToEmpresa(entidad);
        varEnt.setFincaId(fincaService.getFincaById(entidad.fincaId()));

        try {
            return empresaRepository.save(varEnt);
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public List<Empresa> findAll() {
            try {
            return empresaRepository.findAll();
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public Map<String, Boolean> delete(Long id) {
        Empresa entidadx = empresaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Materialesx not exist with id :" + id));

        empresaRepository.delete(entidadx);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", true);

        return response;       
    }

    @Override
    public Empresa getEmpresaById(Long id) {
        Empresa findEntidad = empresaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Materialesx not exist with id :" + id));
        return findEntidad;        
    }

    @Override
    public Empresa update(EmpresaDto.EmpresaCrearDto entidad, Long id) {
        Empresa entidadx = empresaRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Periodo not exist with id :" + id));
        entidadx.setNombre(entidad.nombre());
        return empresaRepository.save(entidadx);        
    }
    
}
