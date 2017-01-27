package br.com.alura.entrevista;

import javax.sql.DataSource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.web.context.support.SecurityWebApplicationContextUtils;

@SpringBootApplication
public class Config {

	public static void main(String[] args) {
		SpringApplication.run(Config.class, args);
	}
	
	@Bean
	public DataSource dataSource() {
		
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/alura2");
		dataSource.setUsername("root");
		dataSource.setPassword("mysqlr00t!");
		
		return dataSource;
		
	}
	
}
