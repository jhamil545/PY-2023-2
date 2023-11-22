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

import pe.edu.upeu.milkminder.dtos.GanadoDto;
import pe.edu.upeu.milkminder.models.Ganado;
import pe.edu.upeu.milkminder.services.GanadoService;



@RestController
@RequestMapping("/finca/ganado")
public class GanadoController {
    @Autowired
    private GanadoService ganadoService;   
    
    @GetMapping(value = "/list")
    public ResponseEntity<List<Ganado>> listGanado() {
        List<Ganado> actDto = ganadoService.findAll();
        return ResponseEntity.ok(actDto);
        // return new ResponseEntity<>(actDto, HttpStatus.OK);
    }  
    
    @PostMapping("/crear")
    public ResponseEntity<Ganado> createGanado(@RequestBody GanadoDto.GanadoCrearDto entidadx) {        
        Ganado data = ganadoService.save(entidadx);
        return ResponseEntity.ok(data);
    }    
    
    @GetMapping("/buscar/{id}")
    public ResponseEntity<Ganado> getGanadoById(@PathVariable Long id) {
        Ganado entidadx = ganadoService.getGanadoById(id);
        return ResponseEntity.ok(entidadx);
    }    
    
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Map<String, Boolean>> deleteGanado(@PathVariable Long id) {
        Ganado entidadx = ganadoService.getGanadoById(id);
        return ResponseEntity.ok(ganadoService.delete(entidadx.getId()));
    }   
    
    @PutMapping("/editar/{id}")
    public ResponseEntity<Ganado> updateGanado(@PathVariable Long id,
            @RequestBody GanadoDto.GanadoCrearDto entidadxDetails) {
        Ganado updatedEntidadx = ganadoService.update(entidadxDetails, id);
        return ResponseEntity.ok(updatedEntidadx);
    }    
}

