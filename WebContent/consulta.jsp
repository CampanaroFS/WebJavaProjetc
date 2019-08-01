<%@ page import="cap13.BD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consulta de Filmes</title>
</head>
<body>
	<%
		BD bd = new BD();
		if(bd.getConnection()){
			try{
				String sql = "SELECT distinct(titulo) FROM Filmes Where titulo like ?";
				PreparedStatement statement = bd.connection.prepareStatement(sql);
				statement.setString(1, "% dolce %");
				ResultSet resultSet = statement.executeQuery();
				out.println("<table border='1' cellspacing='0'>");
				out.println("<tr bgcolor='orange'><th>TÍTULO</th></tr>");
				while(resultSet.next()){
					String titulo = resultSet.getString("titulo");
					out.println("<tr><td>" + titulo + "</td></tr>");
				}
				out.println("</table>");
				resultSet.close();
				statement.close();
				bd.close();
			} catch(SQLException erro){
				out.println(erro.toString());
			}
		} else{
			out.println("Erro ao conectar!");
		}
	%>
</body>
</html>