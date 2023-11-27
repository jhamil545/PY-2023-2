package pe.edu.upeu.milkminder.dtos;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import pe.edu.upeu.milkminder.models.Empresa;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FincaDto {
  Long id;   
  String nombre;
  String nomCort;
  String direccion;
  String descripcion;
  String ubigeo;
  Double ttalHectareas;
  @JsonIgnoreProperties({"finca"})
  Empresa empresaId; 
  
  public record FincaCrearDto(Long id,String nombre,String nomCort,String direccion,
  String descripcion,String ubigeo,Double ttalHectareas,
    Long empresaId){}
}