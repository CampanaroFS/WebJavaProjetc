<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dados recebidos</title>
</head>
<body>
	<%
		String nome = request.getParameter("p_nome");
		String email = request.getParameter("p_email");
		String sexo = request.getParameter("p_sexo");
		String check1 = request.getParameter("p_ck1");
		String check2 = request.getParameter("p_ck2");
		String check3 = request.getParameter("p_ck3");
		String civil = request.getParameter("p_civil");
		out.println("<b>Nome: </b>" + nome + "<br>");
		out.println("<b>Email: </b>" + email + "<br>");
		out.println("<b>Sexo: </b>" + sexo + "<br>");
		if(check1 != null){
			out.println("<b>Romance</b><br>");
		}
		if(check2 != null){
			out.println("<b>Aventura</b><br>");
		}
		if(check3 != null){
			out.println("<b>Ficção</b<br>");
		}
		out.println("<b>Estado civil: </b>" + civil + "<br>");
	%>
</body>
</html>