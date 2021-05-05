package br.gov.pe.desafiodatainfo.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import br.gov.pe.desafiodatainfo.entity.Telefone;
import br.gov.pe.desafiodatainfo.persistence.EntityFactory;

public class TelefoneDao implements Dao<Telefone> {
	@Override
	public Telefone inserir(Telefone telefone) {
		try {
			EntityFactory.getEntityManager().getTransaction().begin();
			telefone = EntityFactory.getEntityManager().merge(telefone);
			EntityFactory.getEntityManager().getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			EntityFactory.getEntityManager().getTransaction().rollback();
		} finally {
			EntityFactory.closeEntityManager();
			EntityFactory.closeEntityManagerFactory();
		}

		return telefone;
	}

	@Override
	public List<Telefone> listar(boolean comTelefones) {
		List<Telefone> listaTelefones = new ArrayList<>();

		try {
			TypedQuery<Telefone> typedQuery = EntityFactory.getEntityManager().createQuery("SELECT t FROM Telefone t",
					Telefone.class);
				listaTelefones.addAll(typedQuery.getResultList());
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			EntityFactory.closeEntityManager();
			EntityFactory.closeEntityManagerFactory();
		}

		return listaTelefones;
	}

	@Override
	public Telefone buscarPorId(final Long id, boolean comTelefones) {
		Telefone telefone = new Telefone();

		try {
			telefone = EntityFactory.getEntityManager().find(Telefone.class, id);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			EntityFactory.closeEntityManager();
			EntityFactory.closeEntityManagerFactory();
		}

		return telefone;
	}

	@Override
	public void alterar(Long id, Telefone telefoneAlterado) {
		Telefone telefoneBanco = buscarPorId(id, false);

		telefoneBanco.setDdd(telefoneAlterado.getDdd());
		telefoneBanco.setNumero(telefoneAlterado.getNumero());
		telefoneBanco.setTipo(telefoneAlterado.getTipo());
		telefoneBanco.setUsuario(telefoneAlterado.getUsuario());

		try {
			EntityFactory.getEntityManager().getTransaction().begin();
			EntityFactory.getEntityManager().merge(telefoneBanco);
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
	public void excluir(Telefone telefone) {
		Telefone telefoneBanco = buscarPorId(telefone.getId(), false);

		try {
			EntityFactory.getEntityManager().getTransaction().begin();
			EntityFactory.getEntityManager().remove(telefoneBanco);
			EntityFactory.getEntityManager().getTransaction().commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			EntityFactory.getEntityManager().getTransaction().rollback();
		} finally {
			EntityFactory.closeEntityManager();
			EntityFactory.closeEntityManagerFactory();
		}
	}
}
