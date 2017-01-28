package br.com.imexperts.entrevista.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.imexperts.entrevista.models.Cliente;

public interface ClienteRepository extends CrudRepository<Cliente, String> {

}
