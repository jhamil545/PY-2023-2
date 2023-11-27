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

import pe.edu.upeu.milkminder.dtos.LecheDto;
import pe.edu.upeu.milkminder.models.Leche;
import pe.edu.upeu.milkminder.services.LecheService;



@RestController
@RequestMapping("/finca/leche")
public class LecheController {
    @Autowired
    private LecheService lecheService;   
    
    @GetMapping(value = "/list")
    public ResponseEntity<List<Leche>> listLeche() {
        List<Leche> actDto = lecheService.findAll();
        return ResponseEntity.ok(actDto);
        // return new ResponseEntity<>(actDto, HttpStatus.OK);
    }  
    
    @PostMapping("/crear")
    public ResponseEntity<Leche> createLeche(@RequestBody LecheDto.LecheCrearDto entidadx) {        
        Leche data = lecheService.save(entidadx);
        return ResponseEntity.ok(data);
    }    
    
    @GetMapping("/buscar/{id}")
    public ResponseEntity<Leche> getLecheById(@PathVariable Long id) {
        Leche entidadx = lecheService.getLecheById(id);
        return ResponseEntity.ok(entidadx);
    }    
    
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Map<String, Boolean>> deleteLeche(@PathVariable Long id) {
        Leche entidadx = lecheService.getLecheById(id);
        return ResponseEntity.ok(lecheService.delete(entidadx.getId()));
    }   
    
    @PutMapping("/editar/{id}")
    public ResponseEntity<Leche> updateLeche(@PathVariable Long id,
            @RequestBody LecheDto.LecheCrearDto entidadxDetails) {
        Leche updatedEntidadx = lecheService.update(entidadxDetails, id);
        return ResponseEntity.ok(updatedEntidadx);
    }    
}