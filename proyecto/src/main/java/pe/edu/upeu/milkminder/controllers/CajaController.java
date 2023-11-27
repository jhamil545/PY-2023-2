package pe.edu.upeu.milkminder.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.parameters.RequestBody;
import pe.edu.upeu.milkminder.models.Caja;
import pe.edu.upeu.milkminder.services.CajaService;


@RestController
@RequestMapping("/finca/caja")

public class CajaController {
    @Autowired
    private CajaService cajaService;

    @GetMapping("/list")
    public ResponseEntity<List<Caja>> list() {
        return ResponseEntity.ok().body(cajaService.listar());
    }

    @PostMapping("/guardar")
    public ResponseEntity<Caja> save(@RequestBody Caja caja) {
        return ResponseEntity.ok(cajaService.guardar(caja));
    }

    @PutMapping("/actualizar")
    public ResponseEntity<Caja> update(@RequestBody Caja coja) {
        return ResponseEntity.ok(cajaService.actualizar(coja));
    }

    @GetMapping("/listar/{id}")
    public ResponseEntity<Caja> listById(@PathVariable(required = true) Long id) {
        return ResponseEntity.ok().body(cajaService.listarPorId(id).get());
    }

    @DeleteMapping("/eliminar/{id}")
    public String deleteById(@PathVariable(required = true) Long id) {
        cajaService.eliminarPorId(id);
        return "Eliminacion Correcta";
    }
    
}
