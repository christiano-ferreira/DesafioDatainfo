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

				<div class="row">
					<div class="col-md-12">
						<h3 class="page-header">Adicionar Telefone</h3>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-2">
						<label for="ddd">DDD</label>
						<input type="number" class="form-control" id="ddd" name="ddd">
					</div>

					<div class="form-group col-md-4">
						<label for="numero">Número</label>
						<input type="text" class="form-control" id="numero" name="numero">
					</div>

					<div class="form-group col-md-4">
						<label for="tipo">Tipo</label>
						<input type="text" class="form-control" id="tipo" name="tipo">
					</div>

					<div class="form-group col-md-12">
						<button class="btn btn-success btn-xs" id="bttAdicionar" name="bttAdicionar" onClick='submitAdicionar()'>Adicionar</button>
					</div>
				</div>

				<div id="botton" class="row">
					<div class="col-md-12">
						<button class="btn btn-default" id="bttConsultar" name="bttConsultar"
		                	onClick='submitConsultar()' value="<%=idUsuario%>">Voltar</button>
					</div>
				</div>
			</form>
		</div>

		<script>
			'use strict'

			function submitAdicionar() {
				$('#formAcoes').attr('action', 'AdicionarTelefoneServlet');
				$("#formAcoes").submit();
    		}

			function submitConsultar() {
				$('#formAcoes').attr('action', 'ConsultarServlet');
				$("#formAcoes").submit();
    		}
		</script>
	</body>
</html>