package pe.edu.upeu.milkminder.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.RequiredArgsConstructor;
//
//

import pe.edu.upeu.milkminder.dtos.EmpresaDto;
import pe.edu.upeu.milkminder.exceptions.AppException;
import pe.edu.upeu.milkminder.exceptions.ResourceNotFoundException;
import pe.edu.upeu.milkminder.mappers.EmpresaMapper;
import pe.edu.upeu.milkminder.models.Empresa;
import pe.edu.upeu.milkminder.repositories.EmpresaRepository;
import pe.edu.upeu.milkminder.services.EmpresaService;
import pe.edu.upeu.milkminder.services.UsuarioService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
@Transactional
public class EmpresaServiceImp implements EmpresaService {
    @Autowired
    private EmpresaRepository empresaRepo;

    @Autowired
    private UsuarioService userService;

    private final EmpresaMapper empresaMapper;

    @Override
    public Empresa save(EmpresaDto.EmpresaCrearDto empresa) {

        Empresa matEnt = empresaMapper.empresaCrearDtoToEmpresa(empresa);
        matEnt.setUserId(userService.getUsuarioById(empresa.fincaId()));
        try {
            return empresaRepo.save(matEnt);
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public List<Empresa> findAll() {
        try {
            return empresaRepo.findAll();
        } catch (Exception e) {
            throw new AppException("Error-" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @Override
    public Map<String, Boolean> delete(Long id) {
        Empresa empresa = empresaRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Company not exist with id :" + id));

        empresaRepo.delete(empresa);
        Map<String, Boolean> response = new HashMap<>();
        response.put("Eliminado : ", true);

        return response;
    }

    @Override
    public Empresa getEmpresaById(Long id) {
        Empresa findEmpresa = empresaRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Company not exist with id :" + id));
        return findEmpresa;
    }

    @Override
    public Empresa update(EmpresaDto.EmpresaCrearDto empresa, Long id) {

        Empresa empresaX = empresaRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Company not exist with id :" + id));

        empresaX.setNombre(empresa.nombre());
        empresaX.setNombreCorto(empresa.nom_cort());
        empresaX.setRuc(empresa.ruc());
        empresaX.setUbigeo(empresa.ubigeo());
        empresaX.setUserId(userService.getUsuarioById(empresa.id()));

        return empresaRepo.save(empresaX);
    }
}
