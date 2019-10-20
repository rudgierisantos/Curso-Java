package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.Produto;
import beans.Telefones;
import connection.SingleConnection;

public class DaoTelefones {

	private Connection connection;

	public DaoTelefones() {
		connection = SingleConnection.getConnection();
	}

	public void salvar(Telefones telefone) {

		try {
			String sql = "insert into telefone(numero, tipo, usuario) values (?,?,?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, telefone.getNumero());
			insert.setString(2, telefone.getTipo());
			insert.setLong(3, telefone.getUsuario());
			insert.execute();
			connection.commit();

		} catch (Exception e) {
			try {
				connection.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public List<Telefones> listarTelefone(Long user) throws Exception {
		List<Telefones> listarTelefone = new ArrayList<Telefones>();

		String sql = "select * from telefone where usuario = " + user;

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultset = statement.executeQuery();
		while (resultset.next()) {
			Telefones telefone = new Telefones();
			telefone.setId(resultset.getLong("id"));
			telefone.setNumero(resultset.getString("numero"));
			telefone.setTipo(resultset.getString("tipo"));
			telefone.setUsuario(resultset.getLong("usuario"));

			listarTelefone.add(telefone);

		}
		return listarTelefone;
	}

	public void delete(String id) {

		try {

			String sql = "delete from telefone where id = '" + id + "'";
			PreparedStatement preparedStatement = connection
					.prepareStatement(sql);
			preparedStatement.execute();

			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();

			try {
				connection.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	

}
