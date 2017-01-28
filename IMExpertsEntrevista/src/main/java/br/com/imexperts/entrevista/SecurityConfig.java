package br.com.imexperts.entrevista;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import br.com.imexperts.entrevista.services.UsuarioService;

//A opção @EnableWebMvcSecurity não será mais utilizada e foi substituida pela opção abaixo:

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UsuarioService service;

	/** 
	 * Criação dos controles de acessos utilizando o Spring Security.
	 * Para acessar a aplicação Web é obrigatório o login do usuário.
	 * Os usuários e suas respectivas permissões devem ser criados diretamente no banco de dados.
	 */
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		// Abaixo são configuradas as páginas que podem e as páginas que não
		// podem ser acessadas pelos usuários. Podem ser definidos controles de
		// acesso baseado nas permissões dos usuários.
		// É recomendável fazer todos os bloqueios primeiro, e depois fazer as
		// liberações.

		http.authorizeRequests().antMatchers("/").hasAnyRole("ADMIN", "USER")

				// Os métodos abaixo obrigam a autenticar através do formulário
				// de login para todos os requests
				.anyRequest().authenticated().and().formLogin();

		// Permite o acesso aos conteúdos estáticos
		http.authorizeRequests().antMatchers("/resources/**").permitAll().anyRequest().permitAll().and().logout()
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout"));

	}

	/**
	 * Configuração da criptografia (BCrypt) que será utilizada para armazenar as senhas.
	 */
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.userDetailsService(service).passwordEncoder(new BCryptPasswordEncoder());
	}

}
