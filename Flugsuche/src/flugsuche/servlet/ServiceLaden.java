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
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import flugsuche.bean.Angebot;
import flugsuche.bean.Buchung;
import flugsuche.bean.Buchungsposition;
import flugsuche.bean.Flug;
import flugsuche.bean.Kunde;
import flugsuche.bean.Zusatzleistung;

/**
 * Servlet implementation class ServiceLaden
 */
@WebServlet("/ServiceLaden")
public class ServiceLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServiceLaden() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
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
			else{
				RequestDispatcher dispatcher = request.getRequestDispatcher("html/Registrierung.jsp");
				dispatcher.forward(request, response);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession session = request.getSession();

		String hinflugid = (String) request.getParameter("HinflugInput");
		String rueckflugid = (String) request.getParameter("RueckflugInput");

		Buchung buchung = new Buchung();
		buchung.setKunde(k);

		List<Flug> hinflugList = (List<Flug>) session.getAttribute("direktflug");
		List<Flug> rueckflugList = (List<Flug>) session.getAttribute("direktflugRueck");

		boolean onlyHinflug = (boolean) session.getAttribute("onlyHinflug");
		int adult = (int) session.getAttribute("erwachsener");
		int baby = (int) session.getAttribute("childs");
		int kind = (int) session.getAttribute("babies");

		int tickets[] = new int[3];
		tickets[0] = adult;
		tickets[1] = kind;
		tickets[2] = baby;
		double[] preisNachlass = { 1.0, 0.8, 0.6 };

		Flug hinflug = getFlug(hinflugList, Integer.parseInt(hinflugid.substring(0, hinflugid.indexOf("_"))));
		Flug rueckFlug = null;
		
		if (onlyHinflug == false)
			rueckFlug = getFlug(rueckflugList, Integer.parseInt(rueckflugid.substring(0, rueckflugid.indexOf("_"))));

		for (int i = 0; i < tickets.length; i++) {
			for (int j = 0; j < tickets[i]; j++) {

				Buchungsposition pos = new Buchungsposition();
				pos.setFlug(hinflug);
				buchung.setHinflug(hinflug);
				pos.setBuchung(buchung);
				pos.setPreis(preisNachlass[i] * hinflug.getPreis());
				buchung.getPositionen().add(pos);

				if (onlyHinflug == false) {
					Buchungsposition pos2 = new Buchungsposition();
					buchung.setRueckflug(rueckFlug);
					pos2.setFlug(rueckFlug);
					pos.setBuchung(buchung);
					pos2.setPreis(preisNachlass[i] * rueckFlug.getPreis());
					buchung.getPositionen().add(pos2);
				}

			}
		}

		hinflug.setZusatzleistungList(getZusatzleistungen(hinflug));
		session.setAttribute("serviceHin", hinflug.getZusatzleistungList());
		request.setAttribute("hinflug", hinflug);
		
		if (onlyHinflug == false) {
			rueckFlug.setZusatzleistungList(getZusatzleistungen(rueckFlug));
			session.setAttribute("serviceRueck", rueckFlug.getZusatzleistungList());
			request.setAttribute("rueckFlug", rueckFlug);
		}
		
		session.setAttribute("Buchung", buchung);

		RequestDispatcher dispatcher = request.getRequestDispatcher("html/Serviceleistungen.jsp");
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

	private List<Zusatzleistung> getZusatzleistungen(Flug flug) {

		String sql = "SELECT * FROM flugzeugtyp join zusatzleistung on flugzeugtypid = fk_flugzeugtyp where flugzeugtypid =  ? ";
		List<Zusatzleistung> listService = new ArrayList<Zusatzleistung>();

		try {
			Connection connection = ds.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, flug.getFlugzeugtyp().getId());
			System.out.println(preparedStatement.toString());
			ResultSet result = preparedStatement.executeQuery();

			while (result.next()) {
				Zusatzleistung service = new Zusatzleistung();
				service.setId(result.getInt("zusatzleistungid"));
				service.setPreis(result.getDouble("preis"));
				service.setBeschreibung(result.getString("beschreibung"));
				service.setBezeichnung(result.getString("zusatzleistung.bezeichnung"));
				service.setFlugzeugtyp(flug.getFlugzeugtyp());
				service.setArt(result.getString("Art"));

				listService.add(service);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listService;
	}

	private Flug getFlug(List<Flug> list, int id) {
		for (Flug flug : list) {
			if (flug.getId() == id)
				return flug;
		}
		return null;
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
