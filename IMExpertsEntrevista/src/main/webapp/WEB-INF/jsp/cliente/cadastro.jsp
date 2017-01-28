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
<title>Cadastro</title>

<link rel="stylesheet" href="assets/css/bootstrap.css" media="screen">
<link rel="stylesheet" href="assets/css/custom.min.css">

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

	<section id="cadastro" class="container" align="center"
		style="margin-top:50px;"> <form:form class="form-horizontal"
		method="POST" action="adicionar" modelAttribute="cliente">

		<fieldset align="center">
			<legend>Cadastrar Usuário</legend>

			<div class="form-group" style="margin-top: 15px;">
				<form:label class="col-lg-2 control-label" path="nome">Nome:</form:label>
				<form:input class="col-lg-10" path="nome"></form:input>
			</div>

			<div class="form-group" style="margin-top: 15px;">
				<form:label class="col-lg-2 control-label" path="cpf">CPF:</form:label>
				<form:input class="col-lg-10" path="cpf"></form:input>
			</div>

			<div class="form-group" style="margin-top: 15px;">
				<form:label class="col-lg-2 control-label" path="email">E-Mail:</form:label>
				<form:input class="col-lg-10" path="email"></form:input>
			</div>

			<div class="form-group" style="margin-top: 15px;">
				<form:label class="col-lg-2 control-label" path="endereco">Endereço:</form:label>
				<form:input class="col-lg-10" path="endereco"></form:input>
			</div>

			<div class="form-group" style="margin-top: 15px;">
				<form:label class="col-lg-2 control-label" path="telefone">Telefone:</form:label>
				<form:input class="col-lg-10" path="telefone"></form:input>
			</div>

			<div class="col-lg-10 col-lg-offset-1" style="margin-top: 25px;">

				<form:button type="reset" class="btn btn-default">Limpar</form:button>

				<form:button type="submit" class="btn btn-default">Salvar</form:button>

				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }" />

			</div>


		</fieldset>

	</form:form> </section>

	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>