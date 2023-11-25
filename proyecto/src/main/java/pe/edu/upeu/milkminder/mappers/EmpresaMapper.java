package pe.edu.upeu.milkminder.mappers;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import pe.edu.upeu.milkminder.dtos.EmpresaDto;
import pe.edu.upeu.milkminder.models.Empresa;

@Mapper(componentModel = "spring")
public interface EmpresaMapper{
    
    EmpresaDto toEmpresaDto(Empresa endtidad);
    
    @Mapping(target = "fincaId", ignore = true)
    Empresa empresaCrearDtoToEmpresa(EmpresaDto.EmpresaCrearDto entidadCrearDto);
    
}
