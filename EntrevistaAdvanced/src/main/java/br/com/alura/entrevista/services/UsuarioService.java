package br.com.alura.entrevista.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import br.com.alura.entrevista.models.Usuario;
import br.com.alura.entrevista.repository.UsuarioRepository;

@Service
public class UsuarioService implements UserDetailsService {
	
	@Autowired
	private UsuarioRepository repository;
	
	public Iterable<Usuario> obterTodos() {

		Iterable<Usuario> convidados = repository.findAll();

		return convidados;

	}

	public void salvar(Usuario usuario) {
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(usuario.getSenha());
		
		usuario.setSenha(hashedPassword);
		
		repository.save(usuario);
	}

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		if (repository.findOne(email) == null) {
			
			throw new RuntimeException("O usuário "+ email +" não foi encontrado");
		}
		
		else {
			
			return repository.findOne(email);
		}
	}

}
