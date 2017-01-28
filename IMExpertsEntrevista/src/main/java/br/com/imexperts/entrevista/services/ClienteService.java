package br.com.imexperts.entrevista.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.imexperts.entrevista.models.Cliente;
import br.com.imexperts.entrevista.repository.ClienteRepository;

@Service
public class ClienteService {

	@Autowired
	private ClienteRepository repository;

	public Iterable<Cliente> obterTodos() {

		Iterable<Cliente> clientes = repository.findAll();

		return clientes;

	}

	public void salvar(Cliente cliente) {

		repository.save(cliente);
	}

	public void deletar(String cpf) {

		Cliente cliente = repository.findOne(cpf);

		repository.delete(cliente);
	}

	public Cliente buscarCliente(String cpf) {

		Cliente cliente = repository.findOne(cpf);

		return cliente;
	}

	public void atualizar(Cliente cliente) {

		repository.save(cliente);

	}

}
