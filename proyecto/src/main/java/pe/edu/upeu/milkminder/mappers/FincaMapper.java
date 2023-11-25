package pe.edu.upeu.milkminder.mappers;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import pe.edu.upeu.milkminder.dtos.FincaDto;
import pe.edu.upeu.milkminder.models.Finca;

@Mapper(componentModel = "spring")
public interface FincaMapper{
    
    FincaDto toFincaDto(Finca endtidad);
    
    @Mapping(target = "ganadoId", ignore = true)
    Finca fincaCrearDtoToFinca(FincaDto.FincaCrearDto entidadCrearDto);
    
}
