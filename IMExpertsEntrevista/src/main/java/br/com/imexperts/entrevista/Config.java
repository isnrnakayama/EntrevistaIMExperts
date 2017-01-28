package br.com.imexperts.entrevista;

import javax.sql.DataSource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;



@SpringBootApplication
public class Config {

	public static void main(String[] args) {
		SpringApplication.run(Config.class, args);
	}
	
	/**
	 * Configuração da conexão com o banco de dados utilizando o Data Source.
	 * 
	 * Algumas configurações foram feitas diretamente no application.properties
	 */
	
	@Bean
	public DataSource dataSource() {
		
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/world");
		dataSource.setUsername("root");
		dataSource.setPassword("password");

		return dataSource;
		
	}
	
}
