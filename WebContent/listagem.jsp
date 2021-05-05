<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ page import="br.gov.pe.desafiodatainfo.entity.Usuario"%>
<%@ page import="br.gov.pe.desafiodatainfo.dao.UsuarioDao"%>

<html>
	<head>
		<title>Listagem de usuários</title>
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
					<h3 class="page-header">Listagem de usuários</h3>
				</div>
			</div>

			<div id="list" class="row">
				<div class="table-responsive col-md-12">
        			<table class="table table-striped">
            			<thead>
                			<tr>
                    			<th>ID</th>
                    			<th>Nome</th>
                    			<th>Email</th>
                    			<th>Senha</th>
                    			<th class="actions">Ações</th>
                 			</tr>
            			</thead>

            			<tbody>
							<%UsuarioDao usuarioDao = new UsuarioDao();
							List<Usuario> listaUsuarios = usuarioDao.listar(false);

							for (Usuario usuario : listaUsuarios) {%>
                				<tr>
                    				<td><%=usuario.getId()%></td>
									<td><%=usuario.getNome()%></td>
									<td><%=usuario.getEmail()%></td>
									<td><%=usuario.getSenha()%></td>

                    				<td class="actions">
                        				<button class="btn btn-success btn-xs" id="bttConsultar">Consultar</button>
                        				<button class="btn btn-warning btn-xs" id="bttAlterar">Alterar</button>
                        				<button class="btn btn-danger btn-xs" id="bttExcluir">Excluir</button>
                    				</td>
                				</tr>
							<%}%>
             			</tbody>
         			</table>
     			</div>
			</div>

 			<div id="botton" class="row">
				<div class="col-md-12">
					<button class="btn btn-primary" id="bttAdicionar">Adicionar usuário</button>
				</div>
			</div>
		</div>

		<script>
			'use strict'

			$('#bttAdicionar').click(function() {
				window.location.href= "adicionar.jsp";
			});
		</script>
	</body>
</html>