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

import pe.edu.upeu.milkminder.dtos.FincaDto;
import pe.edu.upeu.milkminder.models.Finca;
import pe.edu.upeu.milkminder.services.FincaService;

@RestController
@RequestMapping("/finca/finca")
public class FincaController {
    @Autowired
    private FincaService fincaService;   
    
    @GetMapping(value = "/list")
    public ResponseEntity<List<Finca>> listFinca() {
        List<Finca> actDto = fincaService.findAll();
        return ResponseEntity.ok(actDto);
        // return new ResponseEntity<>(actDto, HttpStatus.OK);
    }  
    
    @PostMapping("/crear")
    public ResponseEntity<Finca> createFinca(@RequestBody FincaDto.FincaCrearDto entidadx) {        
        Finca data = fincaService.save(entidadx);
        return ResponseEntity.ok(data);
    }    
    
    @GetMapping("/buscar/{id}")
    public ResponseEntity<Finca> getFincaById(@PathVariable Long id) {
        Finca entidadx = fincaService.getFincaById(id);
        return ResponseEntity.ok(entidadx);
    }    
    
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Map<String, Boolean>> deleteFinca(@PathVariable Long id) {
        Finca entidadx = fincaService.getFincaById(id);
        return ResponseEntity.ok(fincaService.delete(entidadx.getId()));
    }   
    
    @PutMapping("/editar/{id}")
    public ResponseEntity<Finca> updateFinca(@PathVariable Long id,
            @RequestBody FincaDto.FincaCrearDto entidadxDetails) {
        Finca updatedEntidadx = fincaService.update(entidadxDetails, id);
        return ResponseEntity.ok(updatedEntidadx);
    }    
}
