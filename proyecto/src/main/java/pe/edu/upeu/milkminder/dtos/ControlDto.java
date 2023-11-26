package pe.edu.upeu.milkminder.dtos;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class ControlDto {
    private Long id;
    private String etapaDetalle;
    
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate fechaProg;
    
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate fechaReal;

    private Float pesoVivoKg;
    private String preno;
    private String condicionCorporal;
    private Boolean tieneMastitis;
    private String tratamiento;
    private String servicio;
    private Long ganadoId;
    
}
