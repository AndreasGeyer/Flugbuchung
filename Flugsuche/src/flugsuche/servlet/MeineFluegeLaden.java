package flugsuche.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.sql.DataSource;

import flugsuche.bean.Buchung;
import flugsuche.bean.Buchungsposition;
import flugsuche.bean.Flug;
import flugsuche.bean.Flughafen;
import flugsuche.bean.Sitzplatz;
import flugsuche.bean.Zusatzleistung;

/**
 * Servlet implementation class MeineFluegeLaden
 * Geyer Andreas
 */
@WebServlet("/MeineFluegeLaden")
public class MeineFluegeLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;

       

	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

    /**
     * @see HttpServlet#HttpServlet()
     */



	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public MeineFluegeLaden() {
		super();
		// TODO Auto-generated constructor stub

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		select datum, buchungsid, zahlungsart, zahlungsnr, positionsid, abflughafen, ankunfthafen, sitzplatz, passagiername, geburtsdatum, zusatzleistungen 
//		from 

		Cookie cookies[] = request.getCookies();
		String id = "";
		for (int i = 0; i < cookies.length; i++) {
			Cookie c = cookies[i];
			if (c.getName().equals("kundenid")) {
				id = c.getValue();
			}
		}
		List<Buchung> buchungen = getBuchungen(Integer.parseInt(id));
		request.setAttribute("buchungen", buchungen);
		response.setCharacterEncoding("utf-8");
		RequestDispatcher disp = request.getRequestDispatcher("/html/MeineFluege.jsp");
		disp.forward(request, response);
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
	
	


	public List<Buchung> getBuchungen(int kundenid) {
		List<Buchung> buchungen = new ArrayList<Buchung>();

		String qry = "SELECT * from BuchungGesamt where kundenid = ?";

		try (Connection con = ds.getConnection(); PreparedStatement pstmt = con.prepareStatement(qry);) {
			pstmt.setInt(1, kundenid);
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs.next()) {
					boolean idexist = false;
					for (int i = 0; i < buchungen.size(); i++) {
						Buchung b = buchungen.get(i);
						if (b.getId() == rs.getInt("buchungnr")) {
							idexist = true;
							List<Buchungsposition> positionen = b.getPositionen();
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
						}
					}
					if (idexist == false) {
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
						Buchung b = new Buchung();
						b.setPositionen(positionen);
						b.setId(rs.getInt("buchungnr"));
						b.setZahlungsart(rs.getString("zahlungsart"));
						b.setZahlungsnummer(rs.getString("zahlungnr"));
						b.setTimestamp(rs.getTimestamp("buchungdatum"));
						buchungen.add(b);
					}
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (int i = 0; i < buchungen.size(); i++) {
			Buchung b = buchungen.get(i);
			double gesPreis = 0;
			for (int j = 0; j < b.getPositionen().size(); j++) {
				gesPreis += b.getPositionen().get(j).getPreis();
			}
			b.setGesamtPreis(gesPreis);
		}

		return buchungen;
	}

}
