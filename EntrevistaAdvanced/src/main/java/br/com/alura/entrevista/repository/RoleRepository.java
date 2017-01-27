package br.com.alura.entrevista.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.alura.entrevista.models.Role;

public interface RoleRepository extends CrudRepository<Role, String>{

}
