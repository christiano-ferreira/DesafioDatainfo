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

		if (request.getParameter("idUsuario") != null) {
			idUsuario = Long.parseLong(request.getParameter("idUsuario"));
		}

		usuario.setId(idUsuario);
		usuario.setNome(request.getParameter("nome").trim());
		usuario.setEmail(request.getParameter("email").trim());
		usuario.setSenha(request.getParameter("senha").trim());

		if (request.getParameter("bttAdicionar") == "Usuario") {
			UsuarioDao usuarioDao = new UsuarioDao();

			usuario = usuarioDao.inserir(usuario);

			request.setAttribute("idUsuario", usuario.getId());
			request.setAttribute("nome", usuario.getNome());
			request.setAttribute("email", usuario.getEmail());
			request.setAttribute("senha", usuario.getSenha());
		} else if (request.getParameter("bttAdicionar") == "Telefone") {
			TelefoneDao telefoneDao = new TelefoneDao();
			Telefone telefone = new Telefone();

			telefone.setDdd(Integer.parseInt(request.getParameter("ddd").trim()));
			telefone.setNumero(request.getParameter("numero").trim());
			telefone.setTipo(request.getParameter("tipo").trim());
			telefone.setUsuario(usuario);

			telefone = telefoneDao.inserir(telefone);

			request.setAttribute("idUsuario", telefone.getUsuario().getId());
			request.setAttribute("nome", telefone.getUsuario().getNome());
			request.setAttribute("email", telefone.getUsuario().getEmail());
			request.setAttribute("senha", telefone.getUsuario().getSenha());
		}

		RequestDispatcher reqDis = request.getRequestDispatcher("/adicionar.jsp");
		reqDis.forward(request, response);
	}
}
