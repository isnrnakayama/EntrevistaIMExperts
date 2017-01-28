<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Página Inicial</title>

<link rel="stylesheet" href="assets/css/bootstrap.css" media="screen">
<link rel="stylesheet" href="assets/css/custom.min.css">

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/jq-2.2.4/dt-1.10.13/datatables.min.css" />

</head>
<body>

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a href="../" class="navbar-brand">IMExperts</a>
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target="#navbar-main">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse" id="navbar-main">
			<ul class="nav navbar-nav">
				<li><a href="/">Home</a></li>

				<!-- Tag para mostrar os conteúdos apenas para usuários autenticados -->

				<security:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_USER')">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" id="themes">Clientes<span
							class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="themes">
							<li><a href="cliente?acao=cadastro">Cadastro</a></li>

							<li class="divider"></li>

							<li><a href="cliente?acao=listar">Listar</a></li>
							<!-- 							<li><a href="../cerulean/">Cerulean</a></li> -->
						</ul></li>

					<li><a href="logout">Logout</a></li>
					<li class="navbar-right"><a href="#"><security:authentication
								property="principal" var="usuario"></security:authentication>Usuário
							Logado: ${usuario.nome }</a></li>

				</security:authorize>

				<security:authorize access="hasRole('ROLE_ANONYMOUS')">
					<li><a href="login">Login</a></li>
				</security:authorize>
			</ul>
		</div>
	</div>
	</nav>

	<section id="editar" class="container" align="center"
		style="margin-top:50px;">

	<fieldset>
		<legend>Listar Clientes</legend>

		<div class="bs-component" align="center">
			<div class="jumbotron">
				<table id="tabela" class="table table-striped table-hover">

					<thead>
						<tr>
							<th>Nome</th>
							<th>CPF</th>
							<th>Email</th>
							<th>Endereço</th>
							<th>Telefone</th>

							<security:authorize access="hasRole('ROLE_ADMIN')">
								<th></th>
								<th></th>
							</security:authorize>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cliente" items="${clientes }">
							<tr class="info">
								<td>${cliente.nome }</td>
								<td>${cliente.cpf }</td>
								<td>${cliente.email }</td>
								<td>${cliente.endereco }</td>
								<td>${cliente.telefone }</td>

								<security:authorize access="hasRole('ROLE_ADMIN')">
									<td><a href="editar?cpf=${cliente.cpf }">Editar</a></td>
									<td><a href="deletar?cpf=${cliente.cpf }">Deletar</a></td>
								</security:authorize>
							</tr>
						</c:forEach>
					</tbody>


				</table>

			</div>

		</div>


	</fieldset>

	</section>


	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/dt/jq-2.2.4/dt-1.10.13/datatables.min.js"></script>

	<!-- 					DataTables plugin -->
	<script>
		$('#tabela').dataTable();
	</script>
</body>
</html>

