<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dados Recebidos</title>
</head>
<body>
	<%
		String nome = request.getParameter("P_nome");
		String email = request.getParameter("p_email");
		String sexo = request.getParameter("p_sexo");
		String check1 = request.getParameter("p_ck1");
		String check2 = request.getParameter("p_ck2");
		String check3 = request.getParameter("p_ck3");
		String civil = request.getParameter("p_civil");
		out.println("<b>Nome: </b>" + nome + "<br>");
		out.println("<b>Email: </b>" + email + "<br>");
		out.println("<b>: </b>" + sexo + "<br>");
		out.println("<h>Gêneros selecionados: </b><br>");
		if(check1 != null){
			out.println("Romance<br>");
		}
		if(check2 != null){
			out.println("Aventura<br>");
		}
		if(check3 != null){
			out.println("Ficção<br>");
		}
		out.println("<b>Estado Civil: </b>" + civil + "<br>");
	%>
</body>
</html>