<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

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

	<section id="cadastro" class="container" align="center"
		style="margin-top:50px;">

	<form action="adicionar" method="post" class="form-horizontal">

		<fieldset align="center">
			<legend>Cadastrar Usuário</legend>

			<div class="form-group" style="margin-top: 15px;">
				<label for="login" class="col-lg-2 control-label">Login:</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="login" id="login"
						placeholder="Login">
				</div>
			</div>

			<div class="form-group" style="margin-top: 15px;">
				<label for="senha" class="col-lg-2 control-label">Senha:</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="senha" id="senha"
						placeholder="Senha">
				</div>
			</div>

			<div class="form-group" style="margin-top: 15px;">
				<label for="nome" class="col-lg-2 control-label">Nome:</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="nome" id="nome"
						placeholder="Nome">
				</div>
			</div>

			<div class="form-group" style="margin-top: 15px;">
				<label for="endereco" class="col-lg-2 control-label">Endereço:</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="endereco"
						id="endereco" placeholder="Endereco">
				</div>
			</div>

			<div class="form-group" style="margin-top: 15px;">
				<label for="telefone" class="col-lg-2 control-label">Telefone:</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="telefone"
						id="telefone" placeholder="Telefone">
				</div>
			</div>

			<div class="form-group">
				<label for="roles" class="col-lg-2 control-label">Permissão:</label>
				<select name="roles" id="roles" style="margin-top: 25px;">
					<c:forEach var="role" items="${roles }">
						<option>${role.nome }</option>
					</c:forEach>
				</select>
			</div>

			<div class="col-lg-10 col-lg-offset-1" style="margin-top: 25px;">
				<button type="reset" class="btn btn-default">Cancelar</button>
				<button type="submit" class="btn btn-primary">Salvar</button>
				
				<!-- Serve para o Spring gerar um token -->
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			</div>

		</fieldset>


	</form>

	</section>

	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/custom.js"></script>
</body>
</html>