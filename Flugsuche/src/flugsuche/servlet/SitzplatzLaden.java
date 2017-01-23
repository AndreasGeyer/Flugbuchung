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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import flugsuche.bean.Buchung;
import flugsuche.bean.Buchungsposition;
import flugsuche.bean.Flug;
import flugsuche.bean.Flughafen;
import flugsuche.bean.Sitzplatz;
import flugsuche.bean.Zusatzleistung;

/**
 * Servlet implementation class SitzplatzLaden
 * Geyer Andreas
 */
@WebServlet("/SitzplatzLaden")
public class SitzplatzLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SitzplatzLaden() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		Buchung buchung = (Buchung) session.getAttribute("Buchung");
		Flug hinflug = buchung.getHinflug();
		Flug rueckflug = buchung.getRueckflug();

		List<Sitzplatz> sitzplaetzeHin = getSitzplaetze(hinflug.getId());
		if (rueckflug != null) {
			List<Sitzplatz> sitzplaetzeRueck = getSitzplaetze(rueckflug.getId());
			request.setAttribute("sitzplaetzeRueck", sitzplaetzeRueck);
			boolean rueckFistClass = false;
			for(int i = 0; i<buchung.getPositionen().size(); i++){
				if(buchung.getPositionen().get(i).getFlug().getId() == rueckflug.getId() &&
						buchung.getPositionen().get(i).getSitzplatz()!= null){
					rueckFistClass = buchung.getPositionen().get(i).getSitzplatz().isFirstClass();
				}
			}
			request.setAttribute("rueckFirstClass", rueckFistClass);
		}
		boolean hinFistClass = false;
		for(int i = 0; i<buchung.getPositionen().size(); i++){
			if(buchung.getPositionen().get(i).getFlug().getId() == hinflug.getId() &&
					buchung.getPositionen().get(i).getSitzplatz() != null){
				hinFistClass = buchung.getPositionen().get(i).getSitzplatz().isFirstClass();
			}
		}
		request.setAttribute("hinFirstClass", hinFistClass);
		request.setAttribute("sitzplaetzeHin", sitzplaetzeHin);
		RequestDispatcher dispatcher = request.getRequestDispatcher("html/SitzplatzBackup.jsp");
		System.out.println("/html/SitzplatzBackup.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public List<Sitzplatz> getSitzplaetze(int flugnr) {
		List<Sitzplatz> sitzplaetze = new ArrayList<Sitzplatz>();

		String qry = "Select * FROM sitzplatz where fk_flug = ?";
		try (Connection con = ds.getConnection(); PreparedStatement pstmt = con.prepareStatement(qry);) {
			pstmt.setInt(1, flugnr);
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs.next()) {
					Sitzplatz s = new Sitzplatz();
					s.setFirstClass(rs.getBoolean("istFirstClass"));
					s.setId(rs.getInt("sitzplatzId"));
					sitzplaetze.add(s);
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sitzplaetze;
	}

}
