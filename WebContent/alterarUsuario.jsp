<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="br.gov.pe.desafiodatainfo.entity.Usuario"%>

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
 			<div class="row">
				<div class="col-md-12">
					<h3 class="page-header">Alterar usuário</h3>
				</div>
			</div>

			<%Usuario usuario = (Usuario) request.getAttribute("usuario");%>

			<form id="formAcoes" method="post">
				<input type="hidden" id="idUsuario" name="idUsuario" value="<%=(usuario != null) ? usuario.getId() : ""%>">

				<div class="row">
					<div class="form-group col-md-4">
						<label for="nome">Nome</label>
						<input type="text" class="form-control" id="nome" name="nome" autofocus value="<%=(usuario != null) ? usuario.getNome() : ""%>">
					</div>

					<div class="form-group col-md-4">
						<label for="email">Email</label>
						<input type="email" class="form-control" id="email" name="email" value="<%=(usuario != null) ? usuario.getEmail() : ""%>">
					</div>

					<div class="form-group col-md-4">
						<label for="senha">Senha</label>
						<input type="text" class="form-control" id="senha" name="senha" value="<%=(usuario != null) ? usuario.getSenha() : ""%>">
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12">
						<button class="btn btn-success btn-xs" id="bttAlterar" name="bttAlterar"
							onClick='submitAlterar()' value="Salvar">Alterar</button>
					</div>
				</div>
			</form>

			<div id="botton" class="row">
				<div class="col-md-12">
					<button class="btn btn-default" id="bttVoltar">Voltar</button>
				</div>
			</div>
		</div>

		<script>
			'use strict'

			function submitAlterar() {
				$('#formAcoes').attr('action', 'AlterarUsuarioServlet');
				$('#formAcoes').submit();
    		}

			$('#bttVoltar').click(function() {
				window.location.href= "listagem.jsp";
			});
		</script>
	</body>
</html>