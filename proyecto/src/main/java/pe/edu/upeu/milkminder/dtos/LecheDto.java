package pe.edu.upeu.milkminder.dtos;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import pe.edu.upeu.milkminder.models.Ganado;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LecheDto {
  Long id;   
  @JsonFormat(pattern = "yyyy-MM-dd")
  LocalDate fechaRec; 
  String cantidadLt; 
  String turno;
  @JsonIgnoreProperties({"leche"})
  Ganado ganadoId; 
  
  public record LecheCrearDto(Long id,LocalDate fechaRec,
  String cantidadLt,String turno,  Long ganadoId){}
}