package br.gov.pe.desafiodatainfo.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.gov.pe.desafiodatainfo.dao.UsuarioDao;

public class ExcluirUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("bttExcluir") != null && !request.getParameter("bttExcluir").equals("")) {
			Long idUsuario = Long.parseLong(request.getParameter("bttExcluir"));

			UsuarioDao usuarioDao = new UsuarioDao();
			usuarioDao.excluir(idUsuario);
		} 

		RequestDispatcher reqDis = request.getRequestDispatcher("/listagem.jsp");
		reqDis.forward(request, response);
	}
}
