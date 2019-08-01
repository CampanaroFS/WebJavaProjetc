package cap14;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletFIlmesExclusao")
public class ServletFIlmesExclusao extends HttpServlet {
	private static final long serialVersionUID = 2546478655712191008L;

	public ServletFIlmesExclusao() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Exclusão de Filmes</title></head>");
		out.println("<body>");
		FilmesDAO filmes = new FilmesDAO();
		filmes.bd.getConnection();
		try {
			filmes.filme.setCodigo(request.getParameter("p_codigo"));
			String retorno = filmes.atualizar(FilmesDAO.EXCLUSAO);
			filmes.bd.close();
			out.println("<b>" + retorno + "</b>");
		} catch(NullPointerException error) {
			out.println("<b>Falha: " + error.toString() + "</b>");
		}
		out.println("<br><input type='button' value='voltar' onclick='history.go(-1)'>");
		out.println("</body></html>");
	}

}
