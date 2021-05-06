<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<head>
		<title>Adicionar telefone</title>
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
			<form id="formAcoes" method="post">
				<%String idUsuario = (String) request.getAttribute("idUsuario");%>

				<input type="hidden" id="idUsuario" name="idUsuario" value="<%=idUsuario%>">
				<input type="hidden" name="bttConsultar" value="<%=idUsuario%>">

				<div class="row">
					<div class="col-md-6">
						<h3 class="page-header">Adicionar Telefone</h3>
					</div>

					<div class="col-md-6">
						<%String mensagemRetorno = (String) request.getAttribute("mensagemRetorno");%>
						<h3 id="mensagemRetorno" class="page-header" style="color:green"><%=(mensagemRetorno != null) ? mensagemRetorno : ""%></h3>
					</div>
				</div>

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

			<div id="botton" class="row">
				<div class="form-group col-md-12">
					<button class="btn btn-success btn-xs" id="bttAdicionarTelefone" name="bttAdicionarTelefone">Adicionar</button>
				</div>
			</div>

			<div id="botton" class="row">
				<div class="col-md-12">
					<button class="btn btn-default" id="bttConsultar" name="bttConsultar">Voltar</button>
				</div>
			</div>
		</div>

		<script>
			'use strict'

			$('#bttAdicionarTelefone').click(function() {
				if (validaInputsTelefone()) {
					$('#formAcoes').attr('action', 'SalvarTelefoneServlet');
					$("#formAcoes").submit();					
				}
			});

			$('#bttConsultar').click(function() {
				$('#formAcoes').attr('action', 'ConsultarServlet');
				$("#formAcoes").submit();
			});

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