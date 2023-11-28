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
public class PastoDto {
  Long id;   
  @JsonFormat(pattern = "yyyy-MM-dd")
  LocalDate fechapast;  
  String area;
  String especiepasto;
  String estadocorte;
  String pesofresc;
  String produccion;
  String aream2;

  
  public record PastoCrearDto(Long id,LocalDate fechapast,String area,String especiepasto,
  String estadocorte,String pesofresc,  String produccion,String aream2 ){}
}
