package pe.edu.upeu.milkminder.controllers;

import com.google.gson.Gson;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

import pe.edu.upeu.milkminder.models.Raza;
import pe.edu.upeu.milkminder.services.RazaService;


@RestController
@RequestMapping("/finca/raza")
public class RazaController {
    
    @Autowired
    private RazaService razaService;
    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ResponseEntity<List<Raza>> listRaza() {
        List<Raza> actDto = razaService.findAll();
        
        //Gson gson = new Gson();
        //String jsonCartList = gson.toJson(actDto);
        //System.out.println("Ver Aqui: "+jsonCartList);
        return ResponseEntity.ok(actDto);
        //return new ResponseEntity<>(actDto, HttpStatus.OK);
    }
    
    @PostMapping("/crear")
    public ResponseEntity<Raza> createRaza(@RequestBody Raza raza) {
        Raza data = razaService.save(raza);
        return ResponseEntity.ok(data);
    }
    
    @GetMapping("/buscar/{id}")
    public ResponseEntity<Raza> getRazaById(@PathVariable Long id) {
        Raza raza = razaService.getRazaById(id);
        return ResponseEntity.ok(raza);
    }
    
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Map<String, Boolean>> deleteRaza(@PathVariable Long id) {
        Raza raza = razaService.getRazaById(id);
        return ResponseEntity.ok(razaService.delete(raza.getId()));
    }
    
    @PutMapping("/editar/{id}")
    public ResponseEntity<Raza> updateRaza(@PathVariable Long id, @RequestBody Raza razaDetails) {        
        Raza updatedRaza = razaService.update(razaDetails, id);
        return ResponseEntity.ok(updatedRaza);
    }      
}
