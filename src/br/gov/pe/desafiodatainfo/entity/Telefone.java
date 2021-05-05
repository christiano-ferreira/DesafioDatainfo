package br.gov.pe.desafiodatainfo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "telefones")
public class Telefone {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "ddd")
	private int ddd;

	@Column(name = "numero")
	private String numero;

	@Column(name = "tipo")
	private String tipo;

	@ManyToOne
	@JoinColumn(name = "idUsuario")
	private Usuario usuario;

	public Long getId() {
		return id;
	}

	public int getDdd() {
		return ddd;
	}

	public String getNumero() {
		return numero;
	}

	public String getTipo() {
		return tipo;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setDdd(int ddd) {
		this.ddd = ddd;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}
