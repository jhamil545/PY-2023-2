package pe.edu.upeu.milkminder.mappers;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;


import pe.edu.upeu.milkminder.dtos.LecheDto;

import pe.edu.upeu.milkminder.models.Leche;

@Mapper(componentModel = "spring")
public interface LecheMapper{
    
    LecheDto toLecheDto(Leche endtidad);
    
    @Mapping(target = "ganadoId", ignore = true)
    Leche lecheCrearDtoToLeche(LecheDto.LecheCrearDto entidadCrearDto);
    
}