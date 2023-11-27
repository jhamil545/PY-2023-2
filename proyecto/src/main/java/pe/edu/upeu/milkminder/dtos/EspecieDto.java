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
public class EspecieDto {
  Long id;   
  @JsonFormat(pattern = "yyyy-MM-dd")
  LocalDate fecha_especie;  
  String descripcion;
  String edad;
  String tipo;

  
  public record EspecieCrearDto(Long id,LocalDate fecha_especie,String descripcion,String edad,
  String tipo ){}
}
