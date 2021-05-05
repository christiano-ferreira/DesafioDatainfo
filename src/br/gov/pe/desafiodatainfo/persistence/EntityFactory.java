package br.gov.pe.desafiodatainfo.persistence;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityFactory {
	private static EntityManagerFactory entityManagerFactory = null;
	private static EntityManager entityManager = null;

	public static EntityManager getEntityManager() {
		if (entityManager == null || !entityManager.isOpen()) {
			entityManager = getEntityManagerFactory().createEntityManager();
		}

		return entityManager;
	}

	public static void closeEntityManager() {
		entityManager.close();
	}

	public static void closeEntityManagerFactory() {
		entityManagerFactory.close();
	}

	private static EntityManagerFactory getEntityManagerFactory() {
		if (entityManagerFactory == null || !entityManagerFactory.isOpen()) {
			entityManagerFactory = Persistence.createEntityManagerFactory("DesafioDatainfo");
		}

		return entityManagerFactory;
	}
}
