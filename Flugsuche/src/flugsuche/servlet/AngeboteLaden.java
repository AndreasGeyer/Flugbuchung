package flugsuche.servlet;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import flugsuche.bean.Angebot;
import flugsuche.bean.Flug;
import flugsuche.bean.Kunde;

/**
 * Servlet implementation class AngeboteLaden
 * Autor Magdalena Hora 
 */
@WebServlet("/AngeboteLaden")
public class AngeboteLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AngeboteLaden() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
		HttpSession session = request.getSession();
		
		List<Angebot> listAngebot = getAngebote(response);
		request.setAttribute("listAngebote", listAngebot);
	
		
		response.setCharacterEncoding("utf-8");

		RequestDispatcher dispatcher = request.getRequestDispatcher("html/Angebotsseite.jsp");
		dispatcher.forward(request, response);
	}



	
	private List<Angebot> getAngebote( HttpServletResponse response) {

		String sql = "SELECT * FROM angebot WHERE fk_flug IS NULL";
		List<Angebot> listAngebot = new ArrayList<Angebot>();
		Connection connection  = null;

		try {
			connection = ds.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
	

			ResultSet result = preparedStatement.executeQuery();

			while (result.next()) {
				Angebot angebot = new Angebot();
				angebot.setId(result.getInt("angebotid"));
				angebot.setBezeichnung( result.getString("bezeichnung"));
				angebot.setBeschreibung(result.getString("beschreibung"));
				
				Blob bild = result.getBlob("bild");
				
				angebot.setBild(result.getBytes("bild"));
				

				listAngebot.add(angebot);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listAngebot;
	}
}
