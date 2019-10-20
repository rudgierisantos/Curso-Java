package testeJava;

import static org.junit.Assert.*;

import org.junit.Test;

import beans.Produto;
import servlet.ServletsProduto;
import dao.DaoProduto;

public class testJava {

	@Test
	public void test() {
		DaoProduto daoProduto = new DaoProduto();
		Produto produto = new Produto();
		
		produto.setNome("Rudgieri TEST");
		produto.setQuantidade(10);
		produto.setValor(20);
		
		daoProduto.salvar(produto);
	}

}
