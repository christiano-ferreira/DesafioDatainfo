package br.gov.pe.desafiodatainfo.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	private static ConnectionFactory instancia;

	private ConnectionFactory() {

	}

	public static ConnectionFactory getInstancia() {
		if (instancia == null) {
			instancia = new ConnectionFactory();
		}

		return instancia;
	}

	public Connection getConexao() {
		Connection conexao = null;

		try {
			conexao = DriverManager.getConnection("jdbc:postgresql://localhost:5432/", "postgres", "admin");
		} catch (SQLException e) {
			System.out.println("Erro na criação da conexão com o banco: " + e.getSQLState());
			System.out.println(e.getMessage());

			e.printStackTrace();
		}

		return conexao;
	}
}
