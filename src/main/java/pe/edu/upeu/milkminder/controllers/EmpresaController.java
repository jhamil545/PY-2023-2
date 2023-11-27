package pe.edu.upeu.milkminder.controllers;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pe.edu.upeu.milkminder.dtos.EmpresaDto;
import pe.edu.upeu.milkminder.models.Empresa;
import pe.edu.upeu.milkminder.services.EmpresaService;

@RestController
@RequestMapping("/finca/empresa")
public class EmpresaController {
    @Autowired
    private EmpresaService empresaService;   
    
    @GetMapping(value = "/list")
    public ResponseEntity<List<Empresa>> listEmpresa() {
        List<Empresa> actDto = empresaService.findAll();
        return ResponseEntity.ok(actDto);
        // return new ResponseEntity<>(actDto, HttpStatus.OK);
    }  
    
    @PostMapping("/crear")
    public ResponseEntity<Empresa> createEmpresa(@RequestBody EmpresaDto.EmpresaCrearDto entidadx) {        
        Empresa data = empresaService.save(entidadx);
        return ResponseEntity.ok(data);
    }    
    
    @GetMapping("/buscar/{id}")
    public ResponseEntity<Empresa> getEmpresaById(@PathVariable Long id) {
        Empresa entidadx = empresaService.getEmpresaById(id);
        return ResponseEntity.ok(entidadx);
    }    
    
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Map<String, Boolean>> deleteEmpresa(@PathVariable Long id) {
        Empresa entidadx = empresaService.getEmpresaById(id);
        return ResponseEntity.ok(empresaService.delete(entidadx.getId()));
    }   
    
    @PutMapping("/editar/{id}")
    public ResponseEntity<Empresa> updateEmpresa(@PathVariable Long id,
            @RequestBody EmpresaDto.EmpresaCrearDto entidadxDetails) {
        Empresa updatedEntidadx = empresaService.update(entidadxDetails, id);
        return ResponseEntity.ok(updatedEntidadx);
    }    
}

