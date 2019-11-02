package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Categoria;
import beans.Produto;
import connection.SingleConnection;

public class DaoProduto {

	private Connection connection;

	public DaoProduto() {
		connection = SingleConnection.getConnection();
	}

	public void salvar(Produto produto) {

		try {
			String sql = "insert into produto(nome, quantidade, valor, categoria_id) values (?,?,?,?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, produto.getNome());
			insert.setDouble(2, produto.getQuantidade());
			insert.setDouble(3, produto.getValor());
			insert.setLong(4, produto.getCategoria_id());
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

	public List<Produto> listarProduto() throws Exception {
		List<Produto> listarProduto = new ArrayList<Produto>();

		String sql = "select * from produto";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultset = statement.executeQuery();
		while (resultset.next()) {
			Produto produto = new Produto();
			produto.setId(resultset.getLong("id"));
			produto.setNome(resultset.getString("nome"));
			produto.setQuantidade(resultset.getDouble("quantidade"));
			produto.setValor(resultset.getDouble("valor"));
			produto.setCategoria_id(resultset.getLong("categoria_id"));

			listarProduto.add(produto);

		}
		return listarProduto;
	}
	
	public List<Categoria> listaCategorias() throws SQLException{
		List<Categoria> retorno = new ArrayList<Categoria>();
		String sql = "select * from categoria";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		while(resultSet.next()){
			Categoria categoria = new Categoria();
			categoria.setId(resultSet.getLong("id"));
			categoria.setNome(resultSet.getString("nome"));
			retorno.add(categoria);
			
		}
		
		return retorno;
		
	}

	public void delete(String id) {

		try {

			String sql = "delete from produto where id = '" + id + "'";
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

	public Produto consultar(String id) throws Exception {
		String sql = "select * from produto where id = '" + id + "'";

		PreparedStatement preStatement = connection.prepareStatement(sql);
		ResultSet resulSet = preStatement.executeQuery();
		if (resulSet.next()) {
			Produto produto = new Produto();
			produto.setId(resulSet.getLong("id"));
			produto.setNome(resulSet.getString("nome"));
			produto.setQuantidade(resulSet.getDouble("quantidade"));
			produto.setValor(resulSet.getDouble("valor"));
			produto.setCategoria_id(resulSet.getLong("categoria_id"));

			return produto;
		}

		return null;

	}

	public boolean validarNome(String nome) throws Exception {
		String sql = "select count(1) as qtd from produto where nome = '"
				+ nome + "'";

		PreparedStatement preStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preStatement.executeQuery();
		if (resultSet.next()) {
			return resultSet.getInt("qtd") <= 0;
		}
		return false;

	}

	public void atualizar(Produto produto) {
		try {
			String sql = "update produto set nome = ?, quantidade = ?, valor = ?, categoria_id = ? where id = "
					+ produto.getId();
			PreparedStatement preparedStatement = connection
					.prepareStatement(sql);
			preparedStatement.setString(1, produto.getNome());
			preparedStatement.setDouble(2, produto.getQuantidade());
			preparedStatement.setDouble(3, produto.getValor());
			preparedStatement.setLong(4, produto.getCategoria_id());

			preparedStatement.executeUpdate();
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
