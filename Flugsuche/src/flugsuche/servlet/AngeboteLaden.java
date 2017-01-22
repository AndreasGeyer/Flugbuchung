package flugsuche.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import flugsuche.bean.Angebot;
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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Kunde k = null;
		Cookie cookies[] = request.getCookies();
		String id = "";
		for (int i = 0; i < cookies.length; i++) {
			Cookie c = cookies[i];
			if (c.getName().equals("kundenid")) {
				id = c.getValue();
			}
		}
		try {
//			if(id != "")
//			k = getAngebot(Integer.parseInt(id), response);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession session = request.getSession();

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

//	private Angebot getAngebot(int id, HttpServletResponse response) {
//		// TODO Auto-generated method stub
//		Angebot angebot = null;
//
//		try (Connection con = ds.getConnection();
//				PreparedStatement pstmt = con.prepareStatement("select * from angebot where kundeid = ?");) {
//			pstmt.setInt(1, id);
//			try (ResultSet rs = pstmt.executeQuery();) {
//				if (rs.next()) {
//					angebot = new Angebot();
//					angebot.setId(id);
//					//wie geht das mit dem Bild?
//					angebot.setBild(rs.getString("bild"));
//					angebot.setBezeichnung(rs.getString("Bezeichnung"));
//					angebot.setBeschreibung(rs.getString("Beschreibung"));
//				} else {
//
//				}
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return angebot;
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
