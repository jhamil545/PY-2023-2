package pe.edu.upeu.milkminder.mappers;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import pe.edu.upeu.milkminder.dtos.CajaDto;
import pe.edu.upeu.milkminder.models.Caja;


@Mapper(componentModel = "spring")
public interface CajaMapper {
    CajaDto toCajaDto(Caja entidad);
    
    @Mapping(target = "finca", ignore = true) // Corrección: Ignorar el mapeo de 'fincaId'
    Caja cajaCrearDtoToCaja(CajaDto.CajaCrearDto entidadCrearDto);
    
}
