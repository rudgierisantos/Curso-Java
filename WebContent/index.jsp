<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel= "stylesheet" href="resources/css/estilo.css">
</head>
<body>
	<div class="login-page">
		<center><h3 style="color: white">Projeto Didático<h3></center>
		<center><h2 style="color: white">JSP + Servlet + JDBC</h2></center>
		<center><span><b>Usuário: admin / <b>Senha: admin</span></center><br/>
		<div class="form">
			<form class="login-form" action="LoginServlet" method="post">
				Login: <input type="text" required id="login" name="login"> <br />
				Senha: <input type="password" required id="senha" name="senha"> <br />
				<button type="submit" value="Logar">Logar</button>



			</form>
		</div>
		<center><h3 style="color: white">Formação Java Web</h3></center>
	</div>
</body>
</html>