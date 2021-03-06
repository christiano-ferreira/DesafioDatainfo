package br.gov.pe.desafiodatainfo.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.gov.pe.desafiodatainfo.dao.TelefoneDao;
import br.gov.pe.desafiodatainfo.dao.UsuarioDao;
import br.gov.pe.desafiodatainfo.entity.Telefone;
import br.gov.pe.desafiodatainfo.entity.Usuario;

public class AdicionarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long idUsuario = null;

		Usuario usuario = new Usuario();
		UsuarioDao usuarioDao = new UsuarioDao();

		if (request.getParameter("idUsuario") != null && !request.getParameter("idUsuario").trim().equals("")) {
			idUsuario = Long.parseLong(request.getParameter("idUsuario"));
		}

		if (idUsuario == null) {
			usuario.setId(idUsuario);
			usuario.setNome(request.getParameter("nome").trim());
			usuario.setEmail(request.getParameter("email").trim());
			usuario.setSenha(request.getParameter("senha").trim());

			usuario = usuarioDao.inserir(usuario);

			request.setAttribute("usuario", usuario);
			request.setAttribute("mensagemRetornoUsuario", "Usu?rio adicionado com sucesso!");
		} else {
			usuario = usuarioDao.buscarPorId(idUsuario, false);

			Telefone telefone = new Telefone();
			TelefoneDao telefoneDao = new TelefoneDao();

			telefone.setDdd(Integer.parseInt(request.getParameter("ddd")));
			telefone.setNumero(request.getParameter("numero").trim());
			telefone.setTipo(request.getParameter("tipo").trim());
			telefone.setUsuario(usuario);

			telefone = telefoneDao.inserir(telefone);

			request.setAttribute("usuario", telefone.getUsuario());
			request.setAttribute("mensagemRetornoTelefone", "Telefone adicionado com sucesso!");
		}

		RequestDispatcher reqDis = request.getRequestDispatcher("/adicionar.jsp");
		reqDis.forward(request, response);
	}
}
