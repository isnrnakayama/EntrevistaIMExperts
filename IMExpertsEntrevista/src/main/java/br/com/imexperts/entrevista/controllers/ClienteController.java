package br.com.imexperts.entrevista.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.imexperts.entrevista.models.Cliente;
import br.com.imexperts.entrevista.services.ClienteService;
import br.com.imexperts.entrevista.services.UsuarioService;

/**
 * Configuração do Controller da classe Cliente
 *
 */
@Controller
public class ClienteController {

	@Autowired
	private ClienteService clienteService;

	@RequestMapping("cliente")
	String indexUsuario(@RequestParam("acao") String acao) {

		return "redirect:" + acao;
	}

	// Página de cadastro de novos clientes
	@RequestMapping("cadastro")
	String cadastro(@ModelAttribute("cliente") Cliente cliente) {

		return "cliente/cadastro";
	}

	// Adiciona um cliente ao banco de dados.
	@RequestMapping("adicionar")
	String adicionar(Cliente cliente) {

		clienteService.salvar(cliente);

		return "cliente/sucesso";
	}

	// Faz a listagem de todos os clientes
	@RequestMapping("listar")
	String listar(Model model) {

		Iterable<Cliente> clientes = clienteService.obterTodos();

		model.addAttribute("clientes", clientes);

		return "cliente/listar";
	}

	// Ao clicar no ícone de edição, o usuário é redirecionado para uma página de alterações.
	@RequestMapping("editar")
	String editar(@RequestParam("cpf") String cpf, Model model) {

		Cliente cliente = clienteService.buscarCliente(cpf);

		model.addAttribute("cliente", cliente);

		return "cliente/editar";
	}
	
	// Carrega a página para fazer uma alteração no cliente selecionado na página anterior (editar)
	@RequestMapping("alterar")
	String alterar(@ModelAttribute("cliente") Cliente cliente) {
		
		System.out.println(cliente.getNome());
		
		clienteService.atualizar(cliente);
		
		return "cliente/alterado";
	}
	
	// Deleta o cliente selecionado na página anterior (listar)
	@RequestMapping("deletar")
	String deletar(@RequestParam("cpf") String cpf) {
		
		clienteService.deletar(cpf);
		
		return "cliente/excluido";
	}

}
