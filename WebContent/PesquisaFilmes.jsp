<%@page import="cap13.BD" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta de filmes</title>
</head>
<body>
	<%
		BD bd = new BD();
		
		String inicial = request.getParameter("p_init");
		inicial += "%";
		if(bd.getConnection()){
			try{
				String sql = "SELECT distinct(titulo) FROM filmes WHERE titulo LIKE ?";
				PreparedStatement statement = bd.connection.prepareStatement(sql);
				statement.setString(1, inicial);
				ResultSet resultSet = statement.executeQuery();
				out.println("<table border='1' cellspacing='1'>");
				out.println("<tr bgColor='green'><th>Título</th></tr>");
				while(resultSet.next()){
					String titulo = resultSet.getString("titulo");
					out.println("<tr><td>" + titulo + "</td></tr>");
				}
				out.println("</table");
				resultSet.close();
				statement.close();
				bd.close();
			} catch(SQLException erro){
				out.println(erro.toString());
			}
			out.println("<br><br><input type='button' value='voltar' onclick='history.go(-1)'>");
		}
	%>
</body>
</html>