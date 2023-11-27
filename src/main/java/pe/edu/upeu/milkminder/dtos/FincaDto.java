package pe.edu.upeu.milkminder.dtos;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import pe.edu.upeu.milkminder.models.Ganado;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FincaDto {
  Long id;   
  String nombre;
  String nom_cort;
  String direccion;
  String descripcion;
  String ubigeo;
  Double ttal_hectareas;
  @JsonIgnoreProperties({"finca"})
  Ganado ganadoId; 
  
  public record FincaCrearDto(Long id,String nombre,String nom_cort,String direccion,
  String descripcion,String ubigeo,Double ttal_hectareas,
    Long ganadoId){}
}