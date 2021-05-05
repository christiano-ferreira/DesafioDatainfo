<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<head>
		<title>Adicionar usuário</title>
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
 			<div class="row">
				<div class="col-md-12">
					<h3 class="page-header">Adicionar usuário</h3>
				</div>
			</div>

			<input type="hidden" id="idUsuario" name="idUsuario"
				value="<%=(request.getAttribute("idUsuario") != null) ? request.getAttribute("idUsuario") : ""%>">

			<form action="AdicionarServlet" method="post">
				<div class="row">
					<div class="form-group col-md-4">
						<label for="nome">Nome</label>
						<input type="text" class="form-control" id="nome" name="nome" autofocus="autofocus"
							value="<%=(request.getAttribute("nome") != null) ? request.getAttribute("nome") : ""%>">
					</div>

					<div class="form-group col-md-4">
						<label for="email">Email</label>
						<input type="email" class="form-control" id="email" name="email"
							value="<%=(request.getAttribute("email") != null) ? request.getAttribute("email") : ""%>">
					</div>

					<div class="form-group col-md-4">
						<label for="senha">Senha</label>
						<input type="password" class="form-control" id="senha" name="senha"
							value="<%=(request.getAttribute("senha") != null) ? request.getAttribute("senha") : ""%>">
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<button class="btn btn-success btn-xs" type="submit" id="bttAdicionarUsuario" name="bttAdicionar" value="Usuario">Adicionar</button>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<h3 class="page-header">Adicionar Telefone</h3>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-2">
						<label for="ddd">DDD</label>
						<input type="text" class="form-control" id="ddd">
					</div>

					<div class="form-group col-md-4">
						<label for="numero">Número</label>
						<input type="text" class="form-control" id="numero">
					</div>

					<div class="form-group col-md-4">
						<label for="tipo">Tipo</label>
						<input type="text" class="form-control" id="tipo">
					</div>

					<div class="form-group col-md-12">
						<button class="btn btn-success btn-xs" type="submit" id="bttAdicionarTelefone" name="bttAdicionar" value="Telefone">Adicionar</button>
					</div>
				</div>
			</form>

			<div id="botton" class="row">
				<div class="col-md-12">
					<button class="btn btn-default" id="bttCancelar">Cancelar</button>
				</div>
			</div>
		</div>

		<script>
			'use strict'

			if ($('#idUsuario').val() == '') {
				$('#bttAdicionarTelefone').attr('disabled', 'disabled');
			} else {
				$('#nome').attr('disabled', 'disabled');
				$('#email').attr('disabled', 'disabled');
				$('#senha').attr('disabled', 'disabled');
				$('#bttAdicionarUsuario').attr('disabled', 'disabled');

				$('#bttAdicionarTelefone').removeAttr('disabled');
			}

			$('#bttCancelar').click(function() {
				window.location.href= "listagem.jsp";
			});
		</script>
	</body>
</html>