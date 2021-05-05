<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<head>
		<title>Alterar usuário</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link href="webjars/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="webjars/jquery/3.6.0/dist/jquery.min.js"></script>
	</head>

	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
 			<div class="container-fluid">
  				<div class="navbar-header">
   					<span class="navbar-brand">Projeto de conclusão da Capacitação Datainfo</span>
  				</div>
   			</div>
		</nav>

		<br/>

		<div id="main" class="container-fluid">
 			<div id="top" class="row">
				<div class="col-md-12">
					<h3 class="page-header">Alterar usuário</h3>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-5">
					<label for="nome">Nome</label>
					<input type="text" class="form-control" id="nome" autofocus="autofocus">
				</div>

				<div class="form-group col-md-5">
					<label for="email">Email</label>
					<input type="email" class="form-control" id="email">
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-5">
					<label for="senha">Senha</label>
					<input type="password" class="form-control" id="senha">
				</div>
			</div>

			<div id="botton" class="row">
				<div class="col-md-12">
					<button class="btn btn-primary">Salvar</button>
					<button class="btn btn-default">Cancelar</button>
				</div>
			</div>
		</div>
	</body>
</html>