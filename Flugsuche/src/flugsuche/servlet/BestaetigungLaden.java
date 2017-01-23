package flugsuche.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
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
 * Servlet implementation class BestaetigungLaden
 * Geyer Andreas
 */
@WebServlet("/BestaetigungLaden")
public class BestaetigungLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestaetigungLaden() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Enumeration<String> attributes = session.getAttributeNames();
		int buchungsnr = ((Buchung)session.getAttribute("buchung")).getId();
		while(attributes.hasMoreElements()){
			String att = attributes.nextElement();
			session.removeAttribute(att);
		}

		System.out.println("Buchungsnr:" +buchungsnr);
		Buchung buchung = getBuchung(buchungsnr);
		System.out.println(buchung.getZahlungsart());
		request.setAttribute("buchungb", buchung);
		response.setCharacterEncoding("utf-8");
		RequestDispatcher disp = request.getRequestDispatcher("/html/Bestellbestaetigung.jsp");
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public Buchung getBuchung(int buchungsnr){
		Buchung buchung = new Buchung();
		
		String qry = "SELECT * from BuchungGesamt where buchungnr = ?";

		boolean erste = true;
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(qry);) {
			pstmt.setInt(1, buchungsnr);
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs.next()) {
					if(erste == false){
						List<Buchungsposition> positionen = buchung.getPositionen();
						// Abflughafen
						Flughafen abhafen = new Flughafen();
						abhafen.setKuerzel(rs.getString("abkuerzel"));
						abhafen.setOrt(rs.getString("abort"));
						abhafen.setLand(rs.getString("abland"));
						// Anflughafen
						Flughafen anhafen = new Flughafen();
						anhafen.setKuerzel(rs.getString("ankuerzel"));
						anhafen.setOrt(rs.getString("anort"));
						anhafen.setLand(rs.getString("anland"));
						// Flug
						Flug f = new Flug();
						f.setAbFlughafen(abhafen);
						f.setAnFlughafen(anhafen);
						f.setAbflugzeit(rs.getTimestamp("abflugzeit"));
						f.setFlugdauer(rs.getTimestamp("flugdauer"));
						f.setId(rs.getInt("flugnr"));
						// Sitzplatz
						Sitzplatz s = new Sitzplatz();
						s.setFirstClass(rs.getBoolean("istFirstClass"));
						s.setId(rs.getInt("sitzplatz"));
						// Zusatzleistung
						Zusatzleistung z = new Zusatzleistung();
						z.setBezeichnung(rs.getString("bezeichnung"));
						// Position
						Buchungsposition pos = new Buchungsposition();
						pos.setFlug(f);
						pos.setPassagierNachname(rs.getString("passagierNachname"));
						pos.setPassagierVorname(rs.getString("passagierVorname"));
						pos.setGeburtsdatum(rs.getDate("geburtsdatum"));
						pos.setPositionid(rs.getInt("positionid"));
						pos.setPreis(rs.getDouble("preis"));
						pos.setSitzplatz(s);
						pos.setZusatzleistung(z);
						positionen.add(pos);
					}else{
						// Abflughafen
						Flughafen abhafen = new Flughafen();
						abhafen.setKuerzel(rs.getString("abkuerzel"));
						abhafen.setOrt(rs.getString("abort"));
						abhafen.setLand(rs.getString("abland"));
						// Anflughafen
						Flughafen anhafen = new Flughafen();
						anhafen.setKuerzel(rs.getString("ankuerzel"));
						anhafen.setOrt(rs.getString("anort"));
						anhafen.setLand(rs.getString("anland"));
						// Flug
						Flug f = new Flug();
						f.setAbFlughafen(abhafen);
						f.setAnFlughafen(anhafen);
						f.setAbflugzeit(rs.getTimestamp("abflugzeit"));
						f.setFlugdauer(rs.getTimestamp("flugdauer"));
						f.setId(rs.getInt("flugnr"));
						// Sitzplatz
						Sitzplatz s = new Sitzplatz();
						s.setFirstClass(rs.getBoolean("istFirstClass"));
						s.setId(rs.getInt("sitzplatz"));
						// Zusatzleistung
						Zusatzleistung z = new Zusatzleistung();
						z.setBezeichnung(rs.getString("bezeichnung"));
						// Position
						Buchungsposition pos = new Buchungsposition();
						pos.setFlug(f);
						pos.setPassagierNachname(rs.getString("passagierNachname"));
						pos.setPassagierVorname(rs.getString("passagierVorname"));
						pos.setGeburtsdatum(rs.getDate("geburtsdatum"));
						pos.setPositionid(rs.getInt("positionid"));
						pos.setPreis(rs.getDouble("preis"));
						pos.setSitzplatz(s);
						pos.setZusatzleistung(z);
						
						List<Buchungsposition> positionen = new ArrayList<Buchungsposition>();
						positionen.add(pos);
						buchung.setPositionen(positionen);
						buchung.setId(rs.getInt("buchungnr"));
						buchung.setZahlungsart(rs.getString("zahlungsart"));
						buchung.setZahlungsnummer(rs.getString("zahlungnr").replace("_", " / "));
						buchung.setTimestamp(rs.getTimestamp("buchungdatum"));
						erste = false;
					}
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		double gespreis = 0;
		System.out.println("anzahl: " + buchung.getPositionen().size());
		for(int i = 0; i< buchung.getPositionen().size(); i++){
			gespreis += buchung.getPositionen().get(i).getPreis();
		}
		
		buchung.setGesamtPreis(gespreis);
		return buchung;
	}

}
