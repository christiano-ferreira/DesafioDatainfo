<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="br.gov.pe.desafiodatainfo.entity.Usuario"%>
<%@ page import="br.gov.pe.desafiodatainfo.entity.Telefone"%>

<!DOCTYPE html>

<html>
	<head>
		<title>Consultar usuário</title>
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
					<h3 class="page-header">Consultar usuário</h3>
				</div>
			</div>

			<%Usuario usuario = (Usuario) request.getAttribute("usuario");%>

			<div class="row">
				<div class="form-group col-md-5">
					<p><strong>Nome</strong></p>
 					<p><%=usuario.getNome()%></p>
				</div>

				<div class="form-group col-md-5">
					<p><strong>Email</strong></p>
 					<p><%=usuario.getEmail()%></p>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-5">
					<p><strong>Senha</strong></p>
 					<p><%=usuario.getSenha()%></p>
				</div>
			</div>

			<div id="top" class="row">
				<div class="col-md-12">
					<h3 class="page-header">Telefones</h3>
				</div>
			</div>

			<div id="list" class="row">
				<div class="table-responsive col-md-12">
					<form id="formAcoes" method="post">
						<input type="hidden" id="idUsuario" name="idUsuario" value="<%=usuario.getId()%>">

	        			<table class="table table-striped">
	            			<thead>
	                			<tr>
	                    			<th>ID</th>
	                    			<th>DDD</th>
	                    			<th>Número</th>
	                    			<th>Tipo</th>
	                 			</tr>
	            			</thead>

	            			<tbody>
								<%for (Telefone telefone : usuario.getTelefones()) {%>
	               					<tr>
	                   					<td><%=telefone.getId()%></td>
										<td><%=telefone.getDdd()%></td>
										<td><%=telefone.getNumero()%></td>
										<td><%=telefone.getTipo()%></td>

	                   					<td class="actions">
	                       					<button class="btn btn-danger btn-xs" id="bttExcluir" name="bttExcluir"
	                       						onClick='submitExcluir()' value="<%=telefone.getId()%>">Excluir</button>
	                   					</td>
	               					</tr>
								<%}%>
	             			</tbody>
	         			</table>
         			</form>
     			</div>
			</div>

			<div id="botton" class="row">
				<div class="col-md-12">
					<button class="btn btn-primary" id="bttAdicionar" onClick='submitAdicionarTelefone()'>Adicionar telefone</button>
					<button class="btn btn-default" id="bttVoltar">Voltar</button>
				</div>
			</div>
		</div>

		<script>
			'use strict'

			function submitExcluir() {
				if (confirm("Deseja realmente excluir esse telefone?")) {
					$('#formAcoes').attr('action', 'ExcluirTelefoneServlet');
					$("#formAcoes").submit();
				}
			}

			function submitAdicionarTelefone() {
				$('#formAcoes').attr('action', 'AdicionarTelefoneServlet');
				$("#formAcoes").submit();
			}

			$('#bttVoltar').click(function() {
				window.location.href= 'listagem.jsp';
			});
		</script>
	</body>
</html>