package pe.edu.upeu.milkminder.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

import pe.edu.upeu.milkminder.exceptions.AppException;
import pe.edu.upeu.milkminder.exceptions.ResourceNotFoundException;

import pe.edu.upeu.milkminder.models.Empresa;

import pe.edu.upeu.milkminder.repositories.EmpresaRepository;

@RequiredArgsConstructor
@Service
@Transactional



public class EmpresaServiceImp implements EmpresaService{

    @Autowired
    private EmpresaRepository empresaRepo;


    
    @Override
    public Empresa save(Empresa empresa) {
        
        try {
            return empresaRepo.save(empresa);
        } catch (Exception e) {
            throw new AppException("Error-"+e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public List<Empresa> findAll() {
        try {
            return empresaRepo.findAll();
        } catch (Exception e) {
            throw new AppException("Error-"+e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public Map<String, Boolean> delete(Long id) {
        Empresa empresax = empresaRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Actividad not exist with id :" + id));

        empresaRepo.delete(empresax);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", true);

        return response;        
    }

    @Override
    public Empresa getEmpresaById(Long id) {
        Empresa findEmpresa = empresaRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Activiad not exist with id :" + id));
        return findEmpresa;        
    }

    @Override
    public Empresa update(Empresa empresa, Long id) {
        Empresa empresax = empresaRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Periodo not exist with id :" + id));
        empresax.setNombre(empresa.getNombre());
        
        return empresaRepo.save(empresax);        
    }
    
}
