<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Página Inicial</title>

<link rel="stylesheet" href="assets/css/bootstrap.css" media="screen">
<link rel="stylesheet" href="assets/css/custom.min.css">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jq-2.2.4/dt-1.10.13/datatables.min.css"/>

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

				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" id="themes">Usuarios<span
							class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="themes">
							<li><a href="usuario?acao=cadastro">Cadastro</a></li>

							<li class="divider"></li>

							<li><a href="usuario?acao=listar">Listar</a></li>
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

	<div class="container">

		<div class="col-lg-12">
			<div class="page-header">
				<h1 id="containers">Listagem de Usuários: </h1>
			</div>
			<div class="bs-component">
				<div class="jumbotron">



					<fieldset>
						<legend></legend>

						<div class="bs-component">
							<table id="tabela" class="table table-striped table-hover ">


								<thead>
									<tr>
										<th>Login</th>
										<th>Nome</th>
										<th>Endereço</th>
										<th>Telefone</th>
<!-- 										<th>Permissão</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach var="usuario" items="${usuarios }">
										<tr class="info">
											<td>${usuario.login }</td>
											<td>${usuario.nome }</td>
											<td>${usuario.endereco }</td>
											<td>${usuario.telefone }</td>
<%-- 											<td>${usuario.roles.nome }</td> --%>
										</tr>
									</c:forEach>
								</tbody>




							</table>
							<div id="source-button" class="btn btn-primary btn-xs"
								style="display: none;">&lt; &gt;</div>
						</div>

					</fieldset>

					<script src="assets/js/jquery.js"></script>
					<script src="assets/js/bootstrap.min.js"></script>
					<script src="assets/js/custom.js"></script>
					<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jq-2.2.4/dt-1.10.13/datatables.min.js"></script>
					
<!-- 					DataTables plugin -->
					<script>
					$('#tabela').dataTable();
					</script>
</body>
</html>

