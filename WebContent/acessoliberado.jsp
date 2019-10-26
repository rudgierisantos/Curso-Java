<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
	type="beans.BeanCursoJsp" scope="page" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>Seja bem vindo ao sistema em jsp</h3>
		
		<table>
		<tr>
		<td><a href="salvarUsuario?acao=listartodos"> <img
			alt="Cadastro de Usuário" src="resources/img/usuario.png"
			width="80px" height="80px"></a>
			</td>
		<td><a href="salvarProduto?acao=listartodos"> <img
			alt="Cadastro de Produto" src="resources/img/produto.png"
			width="80px" height="80px"></a>
			</td>
			<td>
		  <a href="index.jsp"><img alt="Sair" src="resources/img/sair.png"
			width="99px" height="99px"> </a>
			</td>
		</tr>
		
		<tr>
		<td>Usuário</td>
		<td>Produto</td>
		<td>Sair</td>
		</tr>
		</table>

	</center>
</body>
</html>