<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de usuário</title>
<link rel="stylesheet" href="resources/css/cadastro.css">

</head>
<body>
	<a href="acessoliberado.jsp"><img alt="Inicio"
		src="resources/img/home.jpg" width="30px" height="30px"> </a>
	<a href="index.jsp"><img alt="Sair" src="resources/img/sair.png"
		width="30px" height="30px"> </a>
	<center>
		<h1>Cadastro de Telefones</h1>
		<h3 style="color: red;">${msg}</h3>
	</center>
	<form action="salvarTelefones" method="post" id="formUser"
		onsubmit="return validarCampos()? true :false;">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>User:</td>
						<td><input type="text" readonly="readonly" id="user"
							name="user" class="field-long" value="${userEscolhido.id}"></td>

						<td><input type="text" readonly="readonly" id="nome"
							name="nome" class="field-long" value="${userEscolhido.nome}"></td>
					<tr>
					<tr>
						<td>Número:</td>
						<td><input type="text" id="numero" name="numero"
							class="field-long"></td>
						<td><select id="tipo" name="tipo" style="width: 173px">
								<option>Casa</option>
								<option>Contato</option>
								<option>Celular</option>
						</select></td>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar" style="width: 173px"></td>
						
						<td><input type="submit" value="Voltar" style="width: 173px" onclick="document.getElementById('formUser').action = 'salvarTelefones?acao=voltar'"></td>
					</tr>
				</table>
			</li>
		</ul>
	</form>

	<div class="container">
		<table class="responsive-table">
			<caption>Usuários Cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Número</th>
				<th>Tipo</th>
				<th>Excluir</th>

			</tr>
			<c:forEach items="${telefones}" var="fone">
				<tr>
					<td style="width: 150px"><c:out value="${fone.id}"></c:out></td>
					<td style="width: 150px"><c:out value="${fone.numero}"></c:out></td>
					<td style="width: 150px"><c:out value="${fone.tipo}"></c:out></td>



					<td><a
						href="salvarTelefones?user=${fone.usuario}&acao=deleteFone&foneId=${fone.id}"><img
							src="resources/img/excluir.png" alt="Excluir" title="Excluir"
							width="20px" height="20px"></a></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("numero").value == '') {
				alert('Informe o Número');
				return false;

			} else if (document.getElementById("tipo").value == '') {
				alert('Informe o Tipo');
				return false;

			}
			return true;
		}
	</script>


</body>
</html>