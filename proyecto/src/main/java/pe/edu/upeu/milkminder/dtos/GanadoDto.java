package pe.edu.upeu.milkminder.dtos;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import pe.edu.upeu.milkminder.models.Finca;
import pe.edu.upeu.milkminder.models.Raza;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GanadoDto {
  Long id;   
  String arete;
  String nombre; 
  @JsonFormat(pattern = "yyyy-MM-dd")
  LocalDate fechaNac;  
  String fotoUrl;
  String genero;
  
  @JsonIgnoreProperties({"ganado"})
  Raza razaId;
  Finca fincaId; 
  
  public record GanadoCrearDto(Long id,String arete,String nombre,LocalDate fechaNac,String fotoUrl,
        String genero,Long razaId,Long fincaId ){}
}