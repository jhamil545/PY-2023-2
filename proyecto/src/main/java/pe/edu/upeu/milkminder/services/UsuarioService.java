package pe.edu.upeu.milkminder.services;

import java.util.List;
import java.util.Map;

import pe.edu.upeu.milkminder.dtos.CredencialDto;

//import java.util.List;
//import java.util.Map;

import pe.edu.upeu.milkminder.dtos.CredencialesDto;
import pe.edu.upeu.milkminder.dtos.UsuarioDto;
import pe.edu.upeu.milkminder.models.Usuario;

public interface UsuarioService {

    UsuarioDto login(CredencialesDto credentialsDto);

    UsuarioDto loginByCorreo(CredencialDto correo);

    UsuarioDto register(UsuarioDto.UsuarioCrearDto userDto);

    List<Usuario> findAll();

    Usuario getUsuarioById(Long id);

    String getContrasenaByCorreo(String correo);

    Map<String, Boolean> delete(Long id);

    UsuarioDto findByLogin(String correo);

    Usuario update(UsuarioDto.UsuarioCrearDto asistenciax, Long id);
}
