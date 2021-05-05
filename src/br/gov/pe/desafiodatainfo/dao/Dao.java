package br.gov.pe.desafiodatainfo.dao;

import java.util.List;

public interface Dao<T> {
	public T inserir(T t);
	public List<T> listar(boolean comTelefones);
	public T buscarPorId(final Long id, boolean comTelefones);
	public void alterar(Long id, T t);
	public void excluir(T t);
}
