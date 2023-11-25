package pe.edu.upeu.milkminder.dtos;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import pe.edu.upeu.milkminder.models.Finca;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmpresaDto {
  Long id;   
  String nombre;
  String nom_cort;
  String direccion_fiscal;
  String ruc;
  String ubigeo;
  @JsonIgnoreProperties({"empresa"})
  Finca fincaId; 
  
  public record EmpresaCrearDto(Long id,String nombre,String nom_cort,String direccion_fiscal,
  String ruc,String ubigeo,
    Long fincaId){}
}
