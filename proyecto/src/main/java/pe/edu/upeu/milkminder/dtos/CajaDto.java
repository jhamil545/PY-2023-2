package pe.edu.upeu.milkminder.dtos;

import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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
     @JsonIgnoreProperties({"caja"})
    private Long fincaId;
    

    public record CajaCrearDto(Long id,String movimiento,LocalDate fecha,String glosa,
    Double cantidad,Double recioUnitario,Double subTotal,
     Long fincaId){}
    
}
