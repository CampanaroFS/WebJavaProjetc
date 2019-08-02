package cap14;

import java.io.IOException;
import java.sql.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletFilmesInclusao")
public class ServletFilmesInclusao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletFilmesInclusao() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Inclusão de Fimes</title></head>");
		out.println("<body>");
		FilmesDAO filmes = new FilmesDAO();
		filmes.bd.getConnection();
		filmes.filme.setCodigo(request.getParameter("p_codigo"));
		filmes.filme.setTitulo(request.getParameter("p_titulo"));
		filmes.filme.setGenero(request.getParameter("p_genero"));
		filmes.filme.setProdutora(request.getParameter("p_produtora"));
		filmes.filme.setDataCompra(request.getParameter("p_data"));
		String retorno = "";
		try {
			retorno = filmes.atualizar(FilmesDAO.INCLUSAO);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		filmes.bd.close();
		out.println("<b>" + retorno + "</b>");
		out.println("<br><input type='button' value='voltar' onclick='history.go(-1)'>");
		out.println("</body></html>");
	}
}
