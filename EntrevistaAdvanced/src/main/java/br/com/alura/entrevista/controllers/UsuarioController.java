package br.com.alura.entrevista.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.alura.entrevista.models.Role;
import br.com.alura.entrevista.models.Usuario;
import br.com.alura.entrevista.services.RoleService;
import br.com.alura.entrevista.services.UsuarioService;

@Controller
public class UsuarioController {

	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private RoleService roleService;

	@RequestMapping("usuario")
	String indexUsuario(@RequestParam("acao") String acao) {

		return "redirect:" + acao;
	}

	@RequestMapping("home")
	String homeUsuario() {

		return "usuario/home";
	}

	@RequestMapping("cadastro")
	String cadastro(Model model) {
		
		Iterable<Role> roles = roleService.obterTodos();
		
		model.addAttribute("roles", roles);

		return "usuario/cadastro";
	}

	@RequestMapping("adicionar")
	String adicionar(@RequestParam("login") String login, @RequestParam("senha") String senha,
			@RequestParam("nome") String nome, @RequestParam("endereco") String endereco,
			@RequestParam("telefone") String telefone, Model model) {
		
		Usuario usuario = new Usuario(login, senha, nome, endereco, telefone);
		
		usuarioService.salvar(usuario);
		
		return "usuario/sucesso";

	}
	
	@RequestMapping("listar")
	String listar(Model model) {
		
		Iterable<Usuario> usuarios = usuarioService.obterTodos();
		
		model.addAttribute("usuarios", usuarios);
		
		return "usuario/listar";
	}

}
