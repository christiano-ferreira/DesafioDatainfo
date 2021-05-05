package br.gov.pe.desafiodatainfo.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Hibernate;

import br.gov.pe.desafiodatainfo.entity.Usuario;
import br.gov.pe.desafiodatainfo.persistence.EntityFactory;

public class UsuarioDao implements Dao<Usuario> {
	@Override
	public Usuario inserir(Usuario usuario) {
		try {
			EntityFactory.getEntityManager().getTransaction().begin();
			usuario = EntityFactory.getEntityManager().merge(usuario);
			EntityFactory.getEntityManager().getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			EntityFactory.getEntityManager().getTransaction().rollback();
		} finally {
			EntityFactory.closeEntityManager();
			EntityFactory.closeEntityManagerFactory();
		}

		return usuario;
	}

	@Override
	public List<Usuario> listar(boolean comTelefones) {
		List<Usuario> listaUsuarios = new ArrayList<>();

		try {
			TypedQuery<Usuario> typedQuery = EntityFactory.getEntityManager().createQuery("SELECT u FROM Usuario u",
					Usuario.class);

			if (comTelefones) {
				for (Usuario usuario : typedQuery.getResultList()) {
					Hibernate.initialize(usuario.getTelefones());
					listaUsuarios.add(usuario);
				}
			} else {
				listaUsuarios.addAll(typedQuery.getResultList());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			EntityFactory.closeEntityManager();
			EntityFactory.closeEntityManagerFactory();
		}

		return listaUsuarios;
	}

	@Override
	public Usuario buscarPorId(final Long id, boolean comTelefones) {
		Usuario usuario = new Usuario();

		try {
			usuario = EntityFactory.getEntityManager().find(Usuario.class, id);

			if (comTelefones) {
				Hibernate.initialize(usuario.getTelefones());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			EntityFactory.closeEntityManager();
			EntityFactory.closeEntityManagerFactory();
		}

		return usuario;
	}

	@Override
	public void alterar(Long idUsuario, Usuario usuarioAlterado) {
		Usuario usuarioBanco = buscarPorId(idUsuario, false);

		usuarioBanco.setNome(usuarioAlterado.getNome());
		usuarioBanco.setEmail(usuarioAlterado.getEmail());
		usuarioBanco.setSenha(usuarioAlterado.getSenha());

		try {
			EntityFactory.getEntityManager().getTransaction().begin();
			EntityFactory.getEntityManager().merge(usuarioBanco);
			EntityFactory.getEntityManager().getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			EntityFactory.getEntityManager().getTransaction().rollback();
		} finally {
			EntityFactory.closeEntityManager();
			EntityFactory.closeEntityManagerFactory();
		}
	}

	@Override
	public void excluir(Usuario usuario) {
		Usuario usuarioBanco = buscarPorId(usuario.getId(), false);

		try {
			EntityFactory.getEntityManager().getTransaction().begin();
			EntityFactory.getEntityManager().remove(usuarioBanco);
			EntityFactory.getEntityManager().getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			EntityFactory.getEntityManager().getTransaction().rollback();
		} finally {
			EntityFactory.closeEntityManager();
			EntityFactory.closeEntityManagerFactory();
		}
	}

	public boolean validaLogin(String email, String senha) {
		boolean loginValido = false;

		try {
			CriteriaBuilder criteriaBuilder = EntityFactory.getEntityManager().getCriteriaBuilder();
			CriteriaQuery<Usuario> criteriaQuery = criteriaBuilder.createQuery(Usuario.class);
			Root<Usuario> usuarioRoot = criteriaQuery.from(Usuario.class);

			Predicate pdEmail = criteriaBuilder.equal(usuarioRoot.get("email"), email);
			Predicate pdSenha = criteriaBuilder.equal(usuarioRoot.get("senha"), senha);

			Usuario usuario = EntityFactory.getEntityManager()
					.createQuery(criteriaQuery.select(usuarioRoot).where(criteriaBuilder.and(pdEmail, pdSenha)))
					.getSingleResult();

			if (usuario != null) {
				loginValido = true;
			}
		} catch (NoResultException nre) {
			return loginValido;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			EntityFactory.closeEntityManager();
			EntityFactory.closeEntityManagerFactory();
		}

		return loginValido;
	}
}
