package br.gov.pe.desafiodatainfo.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.gov.pe.desafiodatainfo.dao.UsuarioDao;
import br.gov.pe.desafiodatainfo.entity.Usuario;

public class AlterarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Usuario usuario = new Usuario();
		UsuarioDao usuarioDao = new UsuarioDao();
		Long idUsuario = Long.parseLong(request.getParameter("bttAlterar"));

		usuario = usuarioDao.buscarPorId(idUsuario, false);

		request.setAttribute("usuario", usuario);

		RequestDispatcher reqDis = request.getRequestDispatcher("/alterarUsuario.jsp");
		reqDis.forward(request, response);
	}
}
