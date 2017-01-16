package flugsuche.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

import com.sun.org.apache.xalan.internal.xsltc.runtime.Parameter;

import flugsuche.bean.Buchung;
import flugsuche.bean.Buchungsposition;
import flugsuche.bean.Flug;
import flugsuche.bean.Kunde;
import flugsuche.bean.Zusatzleistung;

/**
 * Servlet implementation class PassgierLaden
 * Autor: Magdalena Hora
 */
@WebServlet("/PassgierLaden")
public class PassgierLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassgierLaden() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		HttpSession session = request.getSession();
		Buchung buchung = (Buchung) session.getAttribute("Buchung");
		
		Flug hin = buchung.getHinflug();
		Flug rueck = buchung.getRueckflug();
		
		boolean onlyHinflug = (boolean) session.getAttribute("onlyHinflug");
		int adult = (int) session.getAttribute("erwachsener");
		int baby = (int) session.getAttribute("childs");
		int kind = (int) session.getAttribute("babies");
		System.out.println(hin);
		int tickets[] = new int[3];
		tickets[0] = adult;
		tickets[1] = kind;
		tickets[2] = baby;
		double[] preisNachlass = { 1.0, 0.8, 0.6 };	


		
		for (int i = 0; i < tickets.length; i++) {
			for (int j = 0; j < tickets[i]; j++) {

				//hier müsste das hin, dass je nach Anzahl oben das angezeigt wird	
				
			}
		}
		
		String leistung = request.getParameter("leistung");
		String[] leistungen = leistung.split(",");
		
		for(int i = 0; i<leistungen.length;i++){
			Flug flug = null;
			Zusatzleistung leist = hin.getZusatzleistung(Integer.parseInt(leistungen[i]));
			flug = hin;
			if(leist == null){
				leist = rueck.getZusatzleistung(Integer.parseInt(leistungen[i]));
				flug = rueck;
			}
			
			if(leist != null){
				Buchungsposition pos = new Buchungsposition();
				pos.setZusatzleistung(leist);
				pos.setFlug(flug);
				pos.setPreis(leist.getPreis());
				buchung.getPositionen().add(pos);
			}
		}
		
		session.setAttribute("Buchung", buchung);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("html/Passagier.jsp");
		dispatcher.forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public Kunde getUser(int id, HttpServletResponse response) throws Exception {
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


}
