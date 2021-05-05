package br.gov.pe.desafiodatainfo.dao;

public interface Dao<T> {
	public T inserir(T t);
	public void excluir(final Long id);
}
