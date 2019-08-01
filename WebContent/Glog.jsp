<%@page import="java.util.Calendar" %>
<%@page import="java.io.*" %>
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
		Calendar calendar = Calendar.getInstance();
		int dia = calendar.get(Calendar.DATE);
		int mes = calendar.get(Calendar.MONTH);
		int ano = calendar.get(Calendar.YEAR);
		int hora = calendar.get(Calendar.HOUR_OF_DAY);
		int minuto = calendar.get(Calendar.MINUTE);
		String endereco = request.getParameter("p_end");
		String tProblema = request.getParameter("p_prob");
		String reclamacao = request.getParameter("p_recl");
		try {
			File dir = new File("C://Users//felip/PortalReclama");
			if(!dir.exists()) {
				dir.mkdir();
			}
				PrintWriter pw = new PrintWriter(new FileWriter("C://Users//felip/PortalReclama/reclamacao.txt", true));
				pw.println("[" + dia + "/" + mes + "/" + ano + "-" + hora + ":" + minuto + "] " + "Local: "+ endereco + "; " + "Tipo de Problema: "+ tProblema + " - Comentário: " + reclamacao);
				pw.flush();
				pw.close();
				
			} catch(Exception error) {
				
			}
		
		out.println("Notificação armazenada!");
		out.println("<br><input type='button' value='voltar' onclick='history.go(-1)'>");
	%>
</body>
</html>