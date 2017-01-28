package br.com.imexperts.entrevista.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;

/**
 * Classe responsável por armazenar os clientes da aplicação
 *
 */
@Entity(name = "Clientes")
@EnableAutoConfiguration
public class Cliente implements Serializable {

	private static final long serialVersionUID = -279134345217397348L;

	@Id
	private String cpf;

	private String nome;
	private String email;
	private String endereco;
	private String telefone;

	public Cliente() {

	}

	public Cliente(String cpf, String nome, String email, String endereco, String telefone) {
		super();
		this.cpf = cpf;
		this.nome = nome;
		this.email = email;
		this.endereco = endereco;
		this.telefone = telefone;
	}

	// Setters e Getters

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
