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

public class SalvarTelefoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Usuario usuario = new Usuario();
		UsuarioDao usuarioDao = new UsuarioDao();
		Long idUsuario = Long.parseLong(request.getParameter("idUsuario"));

		usuario = usuarioDao.buscarPorId(idUsuario, false);

		Telefone telefone = new Telefone();
		TelefoneDao telefoneDao = new TelefoneDao();

		telefone.setDdd(Integer.parseInt(request.getParameter("ddd")));
		telefone.setNumero(request.getParameter("numero").trim());
		telefone.setTipo(request.getParameter("tipo").trim());
		telefone.setUsuario(usuario);

		telefone = telefoneDao.inserir(telefone);

		request.setAttribute("idUsuario", Long.toString(telefone.getUsuario().getId()));
		request.setAttribute("mensagemRetorno", "Telefone adicionado com sucesso!");

		RequestDispatcher reqDis = request.getRequestDispatcher("/adicionarTelefone.jsp");
		reqDis.forward(request, response);
	}
}
