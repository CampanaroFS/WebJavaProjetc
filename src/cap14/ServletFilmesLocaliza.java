package cap14;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletFilmesLocaliza")
public class ServletFilmesLocaliza extends HttpServlet {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 619154494157235135L;
	public ServletFilmesLocaliza() {
        super();
        // TODO Auto-generated constructor stub
    }	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Busca de Filmes</title></head>");
		out.println("<body><form action='ServletFilmesAlteracao' method='get'>");
		out.println("<table border='0' cellspacing='0'>");
		FilmesDAO filmes = new FilmesDAO();
		filmes.bd.getConnection();
		try {
			filmes.filme.setCodigo(request.getParameter("p_codigo"));
			if(filmes.localizar()) {
				out.println("<input type='hidden' name='p_codigo' value='" + filmes.filme.getCodigo() + "'>");
				out.println("<tr><td bgcolor='beige'>Código: </td><td>" + filmes.filme.getCodigo() + "</td><tr>");
				out.println("<tr><td bgcolor='beige'>Titulo: </td><td><input type='text' " + "name='p_titulo' size='50' value='" + filmes.filme.getTitulo() + "'></td></tr>");
				out.println("<tr><td bgcolor='beige'>Gênero: </td><td><input type='text' " + "name='p_genero' " + "value='" + filmes.filme.getGenero() + "'></td></tr>");
				out.println("<tr><td bgcolor='beige'>Produtora: </td><td><input type='text' " + "name='p_produtora' " + "value='" + filmes.filme.getProdutora() + "'></td></tr>");
				out.println("<tr><td bgcolor='beige'>Data de Compra: </td><td><input type='text' " + "name='p_data'" + " value='" + filmes.filme.getDataCompra() + "'></td></tr>");
				out.println("</table><br>");
				out.println("<input type='submit' value='Salvar'>");
			} else {
				out.println("<b>Filme não encontrado</b><br><br>");
			}
			filmes.bd.close();
		} catch(NullPointerException error) {
			out.println("<b>Falha: " + error.toString() + "</br>");
		}
		out.println("<a href='localizar.html'><input type='button' value='Nova Busca'></a>");
		out.println("</form>");
		out.println("<br><input type='button' value='voltar' onclick='history.go(-1)'>");
		out.println("</body><html>");
	}

}
