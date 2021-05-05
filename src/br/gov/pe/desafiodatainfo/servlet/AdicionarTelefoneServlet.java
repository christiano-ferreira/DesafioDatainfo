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

public class AdicionarTelefoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("idUsuario") != null && !request.getParameter("idUsuario").trim().equals("")) {
			Long idUsuario = Long.parseLong(request.getParameter("idUsuario"));

			int ddd = 0;

			if (request.getParameter("ddd") != null) {
				ddd = Integer.parseInt(request.getParameter("ddd"));
			}

			String numero = request.getParameter("numero");
			String tipo = request.getParameter("tipo");

			if (ddd > 0 && numero != null && tipo != null) {
				Usuario usuario = new Usuario();

				UsuarioDao usuarioDao = new UsuarioDao();
				usuario = usuarioDao.buscarPorId(idUsuario, false);

				Telefone telefone = new Telefone();
				TelefoneDao telefoneDao = new TelefoneDao();

				telefone.setDdd(ddd);
				telefone.setNumero(numero.trim());
				telefone.setTipo(tipo.trim());
				telefone.setUsuario(usuario);

				telefoneDao.inserir(telefone);
			}

			request.setAttribute("idUsuario", request.getParameter("idUsuario"));

			RequestDispatcher reqDis = request.getRequestDispatcher("/adicionarTelefone.jsp");
			reqDis.forward(request, response);
		}
	}
}
