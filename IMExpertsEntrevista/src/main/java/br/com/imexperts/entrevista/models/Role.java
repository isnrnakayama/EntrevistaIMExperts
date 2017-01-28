package br.com.imexperts.entrevista.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.security.core.GrantedAuthority;

/**
 * Classe responsável pelo gerenciamento das permissões dos Usuários.
 *
 */
@Entity(name="Roles")
@EnableAutoConfiguration
public class Role implements Serializable, GrantedAuthority{

	private static final long serialVersionUID = -4221216752481690149L;
	
	@Id
	private String nome;

	// Setters e Getters
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String getAuthority() {
		return this.nome;
	}
	
	
}
