package pe.edu.upeu.milkminder.dtos;

import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class CajaDto {
    private Long id;
    private String movimiento;
    
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate fecha;
    
    private String glosa;
    private Double cantidad;
    private Double precioUnitario;
    private Double subTotal;
    private Long fincaId;
    private List<Long> unidadesMedIds;
    private List<Long> cuentasIds;
    
}
