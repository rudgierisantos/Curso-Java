<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de usuário</title>
<link rel="stylesheet" href="resources/css/cadastro.css">

<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
</head>
<body>
	<a href="acessoliberado.jsp"><img alt="Inicio"
		src="resources/img/home.jpg" width="30px" height="30px"> </a>
	<a href="index.jsp"><img alt="Sair" src="resources/img/sair.png"
		width="30px" height="30px"> </a>
	<center>
		<h1>Cadastro de usuário</h1>
		<h3 style="color: red;">${msg}</h3>
	</center>

	<form action="salvarUsuario" method="post" id="formUser"
		onsubmit="return validarCampos()? true :false;"
		enctype="multipart/form-data">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Código:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}"></td>

						<td>Cep:</td>
						<td><input type="text" id="cep" name="cep" maxlength="8"
							value="${user.cep}" placeholder="Informe o Cep"
							onblur="consultaCep();" ></td>
					</tr>

					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome" maxlength="50"
							value="${user.nome }" placeholder="Informe o Nome de Usuário"
							></td>

						<td>Rua:</td>
						<td><input type="text" id="rua" name="rua" maxlength="50"
							value="${user.rua}" placeholder="Informe a rua"></td>
					</tr>

					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}" maxlength="10" placeholder="informe o login"
							></td>

						<td>Bairro:</td>
						<td><input type="text" id="bairro" name="bairro" maxlength="50"
							value="${user.bairro}" placeholder="Informe o bairro"
							></td>
					</tr>

					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha" maxlength="10"
							value="${user.senha }" placeholder="Defina uma senha"
							></td>

						<td>Cidade:</td>
						<td><input type="text" id="cidade" name="cidade" maxlength="50"
							value="${user.cidade}" placeholder="Informe a cidade"
							></td>
					</tr>

					<tr>
						<td>IBGE:</td>
						<td><input type="text" id="ibge" name="ibge" maxlength="30"
							placeholder="Informe o Ibge" value="${user.ibge}"></td>
							
							<td>UF:</td>
						<td><input type="text" id="estado" name="estado" maxlength="20"
							 placeholder="Informe o Estado"
							value="${user.estado}"></td>
					</tr>

					<tr>
						<td>Foto:</td>
						<td><input type="file" id="foto" name="foto"> <input
							type="hidden" name="fototemp" readonly="readonly"
							value="${user.fotoBase64}"> <input type="hidden"
							name="contentTypeTemp" readonly="readonly"
							value="${user.contentType}"></td>
					</tr>

					<tr>
						<td>Curriculo:</td>
						<td><input type="file" id="foto" name="curriculo"> <input
							type="hidden" name="fototempPDF" readonly="readonly"
							value="${user.curriculoBase64}"> <input type="hidden"
							name="contentTypeTempPDF" readonly="readonly"
							value="${user.contentTypeCurriculo}"></td>
					</tr>


					<tr>
						<td></td>
						<td><input type="submit" value="Salvar" style="width: 173px"></td> 
							<td></td>
						<td><input type="submit" value="Cancelar" style="width: 173px"
							onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'"></td>
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
				<th>Nome</th>
				<th>Login</th>
				<th>Imagem</th>
				<th>Curriculo</th>
				<th>Cep</th>
				<th>Rua</th>
				<th>Bairro</th>
				<th>Cidade</th>
				<th>Estado</th>
				<th>Ibge</th>
				<th>Delete</th>
				<th>Editar</th>
				<th>Fones</th>
			</tr>
			<c:forEach items="${usuarios}" var="user">
				<tr>
					<td style="width: 150px"><c:out value="${user.id}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.nome}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.login}"></c:out></td>

					<c:if test="${user.fotoBase64Miniatura.isEmpty()== false}">
						<td style="width: 150px"><a
							href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}"></a><img
							src='<c:out value="${user.fotoBase64Miniatura}"></c:out>'
							alt="Imagem User" title="Imagem User" width="32px" height="32px"></td>
					</c:if>
					<c:if test="${user.fotoBase64Miniatura.isEmpty()== true}">
						<td style="width: 150px"><img alt="Imagem User"
							src=resources/img/userpadrao.jpg width="32px" height="32px" onclick="alert('Não possui imagem')"></td>
					</c:if>

					<c:if test="${user.curriculoBase64.isEmpty()== false}">
						<td style="width: 150px"><a
							href="salvarUsuario?acao=download&tipo=curriculo&user=${user.id}"><img
								alt="Curriculo" src="resources/img/pdf.ico" width="32px"
								height="32px"></a></td>
					</c:if>

					<c:if test="${user.curriculoBase64.isEmpty()== true}">
						<td><img alt="Curriculo" src="resources/img/pdf.ico"
							width="32px" height="32px" onclick="alert('Não Poussui Currículo')"></td>
					</c:if>


					<td style="width: 150px"><c:out value="${user.cep}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.rua}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.bairro}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.cidade}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.estado}"></c:out></td>
					<td style="width: 150px"><c:out value="${user.ibge}"></c:out></td>

					<td><a href="salvarUsuario?acao=delete&user=${user.id}"><img
							src="resources/img/excluir.png" alt="Excluir" title="Excluir"
							width="20px" height="20px"></a></td>
					<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img
							src="resources/img/editar.png" alt="Editar" title="Editar"
							width="20px" height="20px"></a></td>

					<td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img
							src="resources/img/telefone.png" alt="Telefones"
							title="Telefones" width="20px" height="20px"></a></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("nome").value == '') {
				alert('Informe o Nome');
				return false;

			} else if (document.getElementById("login").value == '') {
				alert('Informe o Login');
				return false;
			} else if (document.getElementById("senha").value == '') {
				alert('Informe a Senha');
				return false;
			} else if (document.getElementById("ibge").value == '') {
				alert('Informe o ibge');
				return false;
				
			} else if (document.getElementById("cep").value == '') {
				alert('Informe o Cep');
				return false;
				
			} else if (document.getElementById("rua").value == '') {
				alert('Informe a Rua');
				return false;
				
			} else if (document.getElementById("bairro").value == '') {
				alert('Informe o Bairro');
				return false;
				
			} else if (document.getElementById("cidade").value == '') {
				alert('Informe a Cidade');
				return false;
				
			} else if (document.getElementById("estado").value == '') {
				alert('Informe o Estado');
				return false;
			}
			return true;
		}

		function consultaCep() {
			var cep = $("#cep").val();

			//Consulta o webservice viacep.com.br/
			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {
							//Atualiza os campos com os valores da consulta.
							$("#rua").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#cidade").val(dados.localidade);
							$("#estado").val(dados.uf);
							$("#ibge").val(dados.ibge);
						} //end if.
						else {
							//CEP pesquisado não foi encontrado.
							$("#cep").val('');
							$("#rua").val('');
							$("#bairro").val('');
							$("#cidade").val('');
							$("#estado").val('');
							$("#ibge").val('');
							alert("CEP não encontrado.");
						}
					});
		}
	</script>
</body>
</html>