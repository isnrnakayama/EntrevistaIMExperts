package br.com.alura.entrevista;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import br.com.alura.entrevista.services.UsuarioService;

//A opção @EnableWebMvcSecurity não será mais utilizada e foi substituida pela opção abaixo:

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private UsuarioService service;
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
//		Abaixo são configuradas as páginas que podem e as páginas que não podem ser acessadas pelos usuários. Podem ser definidos controles de acesso baseado nas permissões dos usuários.
//		É recomendável fazer todos os bloqueios primeiro, e depois fazer as liberações.
		
		http.authorizeRequests().antMatchers("/usuario").hasRole("ADMIN")
		.antMatchers("/cadastro").hasRole("ADMIN")
		.antMatchers("/adicionar").hasRole("ADMIN")
//		.antMatchers(HttpMethod.POST).hasRole("ADMIN")
		.antMatchers("/").permitAll()
		
		// Os métodos abaixo obrigam a autenticar através do formulário de login para todos os requests
		.anyRequest().authenticated().and().formLogin();
		
		// Permite o acesso aos conteúdos estáticos
		http.authorizeRequests().antMatchers("/resources/**").permitAll().anyRequest().permitAll()
		.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
		
	}
	
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	
        auth.userDetailsService(service).passwordEncoder(new BCryptPasswordEncoder());
    }
    

}
