package br.gov.pe.desafiodatainfo.dao;

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
	public void excluir(final Long idTelefone) {
		try {
			EntityFactory.getEntityManager().getTransaction().begin();

			Telefone telefone = EntityFactory.getEntityManager().find(Telefone.class, idTelefone);

			EntityFactory.getEntityManager().remove(telefone);
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
