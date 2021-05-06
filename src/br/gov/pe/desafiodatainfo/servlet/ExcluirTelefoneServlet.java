package br.gov.pe.desafiodatainfo.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.gov.pe.desafiodatainfo.dao.TelefoneDao;
import br.gov.pe.desafiodatainfo.dao.UsuarioDao;
import br.gov.pe.desafiodatainfo.entity.Usuario;

public class ExcluirTelefoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long idTelefone = Long.parseLong(request.getParameter("bttExcluir"));

		TelefoneDao telefoneDao = new TelefoneDao();
		telefoneDao.excluir(idTelefone);

		Long idUsuario = Long.parseLong(request.getParameter("idUsuario"));

		Usuario usuario = new Usuario();
		UsuarioDao usuarioDao = new UsuarioDao();

		usuario = usuarioDao.buscarPorId(idUsuario, true);

		request.setAttribute("usuario", usuario);

		RequestDispatcher reqDis = request.getRequestDispatcher("/consultar.jsp");
		reqDis.forward(request, response);
	}
}
