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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import pe.edu.upeu.milkminder.models.Pasto;
import pe.edu.upeu.milkminder.services.PastoService;

@RestController
@RequestMapping("/finca/especie")
public class EspeciesController {
    
@Autowired
    private PastoService PastoService;
    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ResponseEntity<List<Pasto>> listPasto() {
        List<Pasto> actDto = PastoService.findAll();
        
        //Gson gson = new Gson();
        //String jsonCartList = gson.toJson(actDto);
        //System.out.println("Ver Aqui: "+jsonCartList);
        return ResponseEntity.ok(actDto);
        //return new ResponseEntity<>(actDto, HttpStatus.OK);
    }
    
    @PostMapping("/crear")
    public ResponseEntity<Pasto> createPasto(@RequestBody Pasto Pasto) {
        Pasto data = PastoService.save(Pasto);
        return ResponseEntity.ok(data);
    }
    
    @GetMapping("/buscar/{id}")
    public ResponseEntity<Pasto> getPastoById(@PathVariable Long id) {
        Pasto Pasto = PastoService.getPastoById(id);
        return ResponseEntity.ok(Pasto);
    }
    
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Map<String, Boolean>> deletePasto(@PathVariable Long id) {
        Pasto Pasto = PastoService.getPastoById(id);
        return ResponseEntity.ok(PastoService.delete(Pasto.getId()));
    }
    
    @PutMapping("/editar/{id}")
    public ResponseEntity<Pasto> updatePasto(@PathVariable Long id, @RequestBody Pasto PastoDetails) {        
        Pasto updatedPasto = PastoService.update(PastoDetails, id);
        return ResponseEntity.ok(updatedPasto);
    }  
}
