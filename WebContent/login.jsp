<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<head>
		<title>Login</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link href="webjars/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="webjars/jquery/3.6.0/dist/jquery.min.js"></script>
	</head>

	<body>
		<div class="panel-body" align="center">
   			<div class="container" style="margin-top: 10%; margin-bottom: 10%;">
				<div class="panel panel-success" style="max-width: 35%;" align="center">
					<div class="panel-heading form-group" id="divMensagem"></div>

					<div class="panel-body">
   						<div class="form-group" style="text-align: left">
       						<label for="email">Usuário</label>
       						<input type="email" class="form-control" id="email" placeholder="Digite o email" required autofocus>
   						</div>

   						<div class="form-group" style="text-align: left">
       						<label for="senha">Senha</label>
       						<input type="password" class="form-control" id="senha" placeholder="Digite a senha" required>
   						</div>

   						<button style="width: 100%; font-size:1.1em; background-color: blue" class="btn btn-large btn btn-success btn-lg btn-block" id="bttLogin"><b>Login</b></button>
					</div>
				</div>
          	</div>
      	</div>

		<script>
			'use strict'

			$('#divMensagem').css('color', 'gray').text('Entre com os dados para login');

			$('#bttLogin').click(function() {
				$.post('LoginServlet', {
					email : $('#email').val(),
					senha : $('#senha').val()})
				.done(function() {
					window.location.href= "listagem.jsp";
				})
				.fail(function(textoRetorno) {
					$('#divMensagem').css('color', 'red').text(textoRetorno.responseText);
				})
			});
		</script>
	</body>
</html>
