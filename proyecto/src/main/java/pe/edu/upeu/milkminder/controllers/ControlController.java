package pe.edu.upeu.milkminder.controllers;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.endpoint.web.annotation.RestControllerEndpoint;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.parameters.RequestBody;
import pe.edu.upeu.milkminder.models.Control;
import pe.edu.upeu.milkminder.services.ControlService;
@RestController
@RequestMapping("/finca/control")

public class ControlController {
    @Autowired
    private ControlService controlService;

    @GetMapping("/list")
    public ResponseEntity<List<Control>> list() {
        return ResponseEntity.ok().body(controlService.listar());
    }

    @PostMapping("/guardar")
    public ResponseEntity<Control> save(@RequestBody Control control) {
        return ResponseEntity.ok(controlService.guardar(control));
    }

    @PutMapping("/actualizar")
    public ResponseEntity<Control> update(@RequestBody Control control) {
        return ResponseEntity.ok(controlService.actualizar(control));
    }

    @GetMapping("/listar/{id}")
    public ResponseEntity<Control> listById(@PathVariable(required = true) Long id) {
        return ResponseEntity.ok().body(controlService.listarPorId(id).get());
    }

    @DeleteMapping("/eliminar/{id}")
    public String deleteById(@PathVariable(required = true) Long id) {
        controlService.eliminarPorId(id);
        return "Eliminacion Correcta";
    }
    
}
