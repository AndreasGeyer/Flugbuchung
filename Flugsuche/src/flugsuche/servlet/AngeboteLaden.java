package flugsuche.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import flugsuche.bean.Angebot;
import flugsuche.bean.Kunde;

/**
 * Servlet implementation class AngeboteLaden
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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//was muss ich hier nehmen wenn ich Angebote lade?
		
		System.out.println("Get Request");
		Kunde k = null;
		Angebot a = null;
		Cookie cookies[] = request.getCookies();
		String id = "";
		for (int i = 0; i < cookies.length; i++) {
			Cookie c = cookies[i];
			if (c.getName().equals("kundenid")) {
				id = c.getValue();
			}
		}
		try {
			a = getAngebot(Integer.parseInt(id), response);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("kunde", k);
		if (k == null) {
			final PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<body>");
			out.println("<h3>" + "Kunde" + Integer.parseInt(id) + " Leer" + "</h3>");
			out.println("Datum: <b>" + new Date() + "/b");
			out.println("</body>");
			out.println("</html>");
			return;
		}
		System.out.println(request.getContextPath() + "/html/Angebotsseite.jsp");
		RequestDispatcher disp = request.getRequestDispatcher("/html/Angebotsseite.jsp");
		disp.forward(request, response);
		System.out.println("ZUENDE");


	}

	public Angebot getAngebot(int id, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Angebot angebot = null;
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("select * from kunde where angebotid = ?");) {
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					angebot = new Angebot();
					angebot.setId(id);
					angebot.setBezeichnung(rs.getString("Bezeichnung"));
					angebot.setBeschreibung(rs.getString("Beschreibung"));
					//Wie geht das mit dem Bild?
					//angebot.setBild(rs.getBytes(Bild));
					//Brauch ich setFlug und setPreis?
				} else {

				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return angebot;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
