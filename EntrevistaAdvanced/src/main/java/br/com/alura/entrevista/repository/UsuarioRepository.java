package br.com.alura.entrevista.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.alura.entrevista.models.Usuario;

public interface UsuarioRepository extends CrudRepository<Usuario, String>{
	
//	insert into Role values ('ROLE_ADMIN');
//	
//	insert into Usuario (email, nome, senha) values ('admin@casadocodigo.com.br', 'Administrador', '$2a$04$qP517gz1KNVEJUTCkUQCY.JzEoXzHFjLAhPQjrg5iP6Z/UmWjvUhq')
//	
//	insert into Usuario_Role(Usuario_email, roles_nome) values ('admin@casadocodigo.com.br', 'ROLE_ADMIN')

}
