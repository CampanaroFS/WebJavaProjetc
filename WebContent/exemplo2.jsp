<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Vários Tamanhos de Texto</title>
</head>
<body>
	<%
		for(int i = 1; i <= 6; i++){
			out.println("<center><h" + i + ">Iniciando estudos JSP</h" + i + "></center>");
		}
	%>
</body>
</html>