package cap14;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletFilmesAlteracao")
public class ServletFilmesAlteracao extends HttpServlet {
	
	private static final long serialVersionUID = -8229864610071945478L;

	public ServletFilmesAlteracao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Alteração de Filmes</title></head>");
		out.println("<body>");
		FilmesDAO filmes = new FilmesDAO();
		filmes.bd.getConnection();
		try {
			filmes.filme.setCodigo(request.getParameter("p_codigo"));
			filmes.filme.setTitulo(request.getParameter("p_titulo"));
			filmes.filme.setGenero(request.getParameter("p_genero"));
			filmes.filme.setProdutora(request.getParameter("p_produtora"));
			filmes.filme.setDataCompra(request.getParameter("p_data"));
			String retorno = filmes.atualizar(FilmesDAO.ALTERACAO);
			filmes.bd.close();
			out.println("<b>" + retorno + "</b");
		} catch(NullPointerException erro) {
			out.println("<b>Falha: " + erro.toString() + "</b>");
		}
		out.println("<a href='localizar.html'><input type='button' value='Voltar'></a>");
		out.println("</body></html>");
	}

}
