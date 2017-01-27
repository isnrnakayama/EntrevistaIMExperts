package br.com.alura.entrevista.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.alura.entrevista.models.Role;
import br.com.alura.entrevista.repository.RoleRepository;

@Service
public class RoleService {
	
	@Autowired
	private RoleRepository repository;
	
	public Iterable<Role> obterTodos() {

		Iterable<Role> roles = repository.findAll();

		return roles;

	}
	

}
