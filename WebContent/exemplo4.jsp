<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Calendario</title>
</head>
<body>
	<%Calendar calendar = Calendar.getInstance();
	int horaAtual = calendar.get(Calendar.HOUR_OF_DAY);
	String men = "";
	if(horaAtual < 6){
		men = "Boa Madrugada";
	} else if(horaAtual <= 12){
		men = "Bom dia";
	} else if(horaAtual <= 18){
		men = "Boa tarde";
	} else if(horaAtual <= 23){
		men = "Boa noite";
	}
	out.println("<font face='verdana'size=4><b>" + horaAtual + "h - " + men + "</b>, Seja Bem Vindo !!!</font>" );
	%>
</body>
</html>