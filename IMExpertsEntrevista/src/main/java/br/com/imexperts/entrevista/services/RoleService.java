package br.com.imexperts.entrevista.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.imexperts.entrevista.models.Role;
import br.com.imexperts.entrevista.repository.RoleRepository;

@Service
public class RoleService {
	
	@Autowired
	private RoleRepository repository;
	
	public Iterable<Role> obterTodos() {

		Iterable<Role> roles = repository.findAll();

		return roles;

	}
	

}
