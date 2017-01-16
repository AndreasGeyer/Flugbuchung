package flugsuche.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import flugsuche.bean.Buchung;
import flugsuche.bean.Buchungsposition;
import flugsuche.bean.Flug;
import flugsuche.bean.Kunde;
import flugsuche.bean.Zusatzleistung;

/**
 * Servlet implementation class PassagierSpeichern
 * Autor: Magdalena Hora
 */
@WebServlet("/PassagierSpeichern")
public class PassagierSpeichern extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassagierSpeichern() {
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
			if(id != "")
			k = getUser(Integer.parseInt(id), response);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		RequestDispatcher dispatcher = request.getRequestDispatcher("html/Passagier.jsp");
		dispatcher.forward(request, response);

		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}



	

	private Kunde getUser(int id, HttpServletResponse response) {
		Kunde kunde = null;

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("select * from kunde where kundeid = ?");) {
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					kunde = new Kunde();
					kunde.setId(id);
					kunde.setAnrede(rs.getString("anrede"));
					kunde.setTitel(rs.getString("titel"));
					kunde.setVorname(rs.getString("vorname"));
					kunde.setNachname(rs.getString("nachname"));
					kunde.setStrasse(rs.getString("strasse"));
					kunde.setPLZ(rs.getString("postleitzahl"));
					kunde.setHausnummer(rs.getString("hausnummer"));
					kunde.setOrt(rs.getString("ort"));
					kunde.setGeburtsdatum(rs.getDate("geburtsdatum"));
					kunde.setMail(rs.getString("email"));
					kunde.setPasswort(rs.getString("passwort"));
					kunde.setBild(rs.getBytes("nutzerbild"));
					kunde.setPremium(rs.getBoolean("istPremium"));
				} else {

				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kunde;

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
