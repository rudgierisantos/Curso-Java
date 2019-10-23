<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Produtos</title>
<link rel="stylesheet" href="resources/css/cadastro.css">
</head>
<body>
	<a href="acessoliberado.jsp"><img alt="Inicio"
		src="resources/img/home.jpg" width="30px" height="30px"> </a>
	<a href="index.jsp"><img alt="Sair"
		src="resources/img/sair.png" width="30px" height="30px"> </a>
	<center>
		<h1>Cadastro de Produtos</h1>
		<h3 style="color: red;">${msg}</h3>
	</center>

	<form action="salvarProduto" method="post" id="formProduto"
		onsubmit="return validarCampos() ? true: false;">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Código:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${produto.id}"></td>
					</tr>

					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome" maxlength="100" style="width: 300px"
							value="${produto.nome }" class="field-long"></td>
					</tr>

					<tr>
						<td>Quantidade:</td>
						<td><input type="number" id="quantidade" name="quantidade" maxlength="10"
							value="${produto.quantidade}" ></td>
					</tr>

					<tr>
						<td>Valor:</td>
						<td><input type="text" id="valor" name="valor" maxlength="12"
							value="${produto.valor}" ></td>
					</tr>

					<tr>
						<td></td>
						<td><input type="submit" value="Salvar" style="width: 90px">.<input
							type="submit" value="Cancelar" style="width: 90px"
							onclick="document.getElementById('formProduto').action = 'salvarProduto?acao=reset'"></td>
					</tr>


				</table>
			</li>
		</ul>
	</form>

	<div class="container">
		<table class="responsive-table">
			<caption>Produtos Cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Quantidade</th>
				<th>Valor</th>
				<th>Delete</th>
				<th>Editar</th>
			</tr>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td style="width: 150px"><c:out value="${produto.id}"></c:out></td>
					<td style="width: 150px"><c:out value="${produto.nome}"></c:out></td>
					<td style="width: 150px"><c:out value="${produto.quantidade}"></c:out></td>
					<td style="width: 150px"><c:out value="${produto.valor}"></c:out></td>

					<td><a href="salvarProduto?acao=delete&produto=${produto.id}"><img
							src="resources/img/excluir.png" alt="Excluir" title="Excluir"
							width="20px" height="20px"></a></td>
					<td><a href="salvarProduto?acao=editar&produto=${produto.id}"><img
							src="resources/img/editar.png" alt="Editar" title="Editar"
							width="20px" height="20px"></a></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<script type="text/javascript">
		function validarCampos() {

			if (document.getElementById("nome").value == '') {
				alert("Informe o nome");
				return false;
			} else if (document.getElementById("quantidade").value == '') {
				alert("Informe a quantidade");
				return false;
			} else if (document.getElementById("valor").value == '') {
				alert("Informe o valor");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>