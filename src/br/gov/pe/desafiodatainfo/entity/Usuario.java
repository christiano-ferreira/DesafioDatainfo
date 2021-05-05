package br.gov.pe.desafiodatainfo.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name = "usuarios")
@SuppressWarnings("deprecation")
public class Usuario {
	@Id
    @Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

	@Column(name="nome")
    private String nome;

	@Email
	@Column(name="email")
    private String email;

	@Column(name="senha")
    private String senha;

	@OneToMany(mappedBy="usuario")
    private List<Telefone> telefones = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public String getEmail() {
		return email;
	}

	public String getSenha() {
		return senha;
	}

	public List<Telefone> getTelefones() {
		return telefones;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setSenha(String senha) {
		this.senha= senha;
	}

	public void setTelefones(List<Telefone> telefones) {
		this.telefones = telefones;
	}
}
