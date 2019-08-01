<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Calculo</title>
</head>
<body>
	<%
		String numero1 = request.getParameter("p_numero1");
		String numero2 = request.getParameter("p_numero2");
		String operacao = request.getParameter("p_op");
		int num1 = Integer.parseInt(numero1);
		int num2 = Integer.parseInt(numero2);
		if(operacao.equals("+")){
			int total = num1 + num2;
			out.println("<b>O resultado da operação é igual a: </b>" + total + "<br>" );
		}
		if(operacao.equals("-")){
			int total = num1 - num2;
			out.println("<b>O resultado da operação é igual a: </b>" + total + "<br>" );
		}
		if(operacao.equals("*")){
			int total = num1 * num2;
			out.println("<b>O resultado da operação é igual a: </b>" + total + "<br>" );
		}
	%>

</body>
</html>