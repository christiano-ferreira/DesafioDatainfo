<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="br.gov.pe.desafiodatainfo.entity.Usuario"%>

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
				<div class="col-md-6">
					<h3 class="page-header">Adicionar usuário</h3>
				</div>

				<div class="col-md-6">
					<%String mensagemRetornoUsuario = (String) request.getAttribute("mensagemRetornoUsuario");%>
					<h3 id="mensagemRetornoUsuario" class="page-header" style="color:green"><%=(mensagemRetornoUsuario != null) ? mensagemRetornoUsuario : ""%></h3>
				</div>
			</div>

			<%Usuario usuario = (Usuario) request.getAttribute("usuario");%>

			<form id="formUsuario" method="post">
				<input type="hidden" id="idUsuario" name="idUsuario" value="<%=(usuario != null) ? usuario.getId() : ""%>">

				<div class="row">
					<div class="form-group col-md-4">
						<label for="nome">Nome</label><span style="color:red"> *</span>
						<input type="text" class="form-control" id="nome" name="nome" autofocus value="<%=(usuario != null) ? usuario.getNome() : ""%>">
					</div>

					<div class="form-group col-md-4">
						<label for="email">Email</label><span style="color:red"> *</span>
						<input type="email" class="form-control" id="email" name="email" value="<%=(usuario != null) ? usuario.getEmail() : ""%>">
					</div>

					<div class="form-group col-md-4">
						<label for="senha">Senha</label><span style="color:red"> *</span>
						<input type="password" class="form-control" id="senha" name="senha" value="<%=(usuario != null) ? usuario.getSenha() : ""%>">
					</div>
				</div>
			</form>

			<div class="row">
				<div class="form-group col-md-12">
					<button class="btn btn-success btn-xs" id="bttAdicionarUsuario" name="bttAdicionar">Adicionar</button>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6">
					<h3 class="page-header">Adicionar Telefone</h3>
				</div>

				<div class="col-md-6">
					<%String mensagemRetornoTelefone = (String) request.getAttribute("mensagemRetornoTelefone");%>
					<h3 id="mensagemRetornoTelefone" class="page-header" style="color:green"><%=(mensagemRetornoTelefone != null) ? mensagemRetornoTelefone : ""%></h3>
				</div>
			</div>

			<form id="formTelefone" method="post">
				<input type="hidden" id="idUsuarioTelefone" name="idUsuario" value="<%=(usuario != null) ? usuario.getId() : ""%>">

				<div class="row">
					<div class="form-group col-md-2">
						<label for="ddd">DDD</label><span style="color:red"> *</span>
						<input type="number" class="form-control" id="ddd" name="ddd">
					</div>

					<div class="form-group col-md-4">
						<label for="numero">Número</label><span style="color:red"> *</span>
						<input type="text" class="form-control" id="numero" name="numero">
					</div>

					<div class="form-group col-md-4">
						<label for="tipo">Tipo</label><span style="color:red"> *</span>
						<input type="text" class="form-control" id="tipo" name="tipo">
					</div>
				</div>
			</form>

			<div class="row">
				<div class="form-group col-md-12">
					<button class="btn btn-success btn-xs" id="bttAdicionarTelefone" name="bttAdicionar">Adicionar</button>
				</div>
			</div>

			<div id="botton" class="row">
				<div class="col-md-12">
					<button class="btn btn-default" id="bttCancelar">Cancelar</button>
				</div>
			</div>
		</div>

		<script>
			'use strict'

			$('#ddd').attr('disabled', 'disabled');
			$('#numero').attr('disabled', 'disabled');
			$('#tipo').attr('disabled', 'disabled');
			$('#bttAdicionarTelefone').attr('disabled', 'disabled');

			let idUsuario = $('#idUsuario').val();

			if (idUsuario.trim().length >= 1) {
				$('#nome').attr('disabled', 'disabled');
				$('#email').attr('disabled', 'disabled');
				$('#senha').attr('disabled', 'disabled');
				$('#bttAdicionarUsuario').attr('disabled', 'disabled');

				$('#ddd').removeAttr('disabled');
				$('#numero').removeAttr('disabled');
				$('#tipo').removeAttr('disabled');
				$('#bttAdicionarTelefone').removeAttr('disabled');
			}

			$('#bttAdicionarUsuario').click(function() {
				if (validaInputsUsuario()) {
					$('#formUsuario').attr('action', 'AdicionarServlet');
					$("#formUsuario").submit();					
				}
			});

			$('#bttAdicionarTelefone').click(function() {
				if (validaInputsTelefone()) {
					$('#formTelefone').attr('action', 'AdicionarServlet');
					$("#formTelefone").submit();					
				}
			});

			$('#bttCancelar').click(function() {
				window.location.href= "listagem.jsp";
			});

			function validaInputsUsuario() {
				let nome = $('#nome').val();
				let email = $('#email').val();
				let senha = $('#senha').val();

				let usuarioValido = (nome.trim().length >= 1) && (email.trim().length >= 1) && (senha.trim().length >= 1); 					

				if (!usuarioValido) {
					alert('Campos com * são obrigatórios!');

					return false;
				} else {
					let usuario = email.substring(0, email.indexOf("@"));
					let dominio = email.substring(email.indexOf("@")+ 1, email.length);

					let emailValido = (usuario.length >=1) &&
   						(dominio.length >=3) &&
   						(usuario.search("@")==-1) &&
   						(dominio.search("@")==-1) &&
   						(usuario.search(" ")==-1) &&
   						(dominio.search(" ")==-1) &&
   						(dominio.search(".")!=-1) &&
   						(dominio.indexOf(".") >=1)&&
   						(dominio.lastIndexOf(".") < dominio.length - 1);

					if (!emailValido) {
						alert('Entre com um EMAIL válido!');

						return false;
					}
				}

				return true;
			}

			function validaInputsTelefone() {
				let ddd = $('#ddd').val();
				let numero = $('#numero').val();
				let tipo = $('#tipo').val();

				if ((ddd <= 9)) {
					alert('Entre com um DDD válido!');

					return false;
				}

				let telefoneValido = (numero.trim().length >= 1) && (tipo.trim().length >= 1);

				if (!telefoneValido) {
					alert('Campos com * são obrigatórios!');

					return false;
				}

				return true;
			}
		</script>
	</body>
</html>