package flugsuche.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import flugsuche.bean.Flug;
import flugsuche.bean.Fluggesellschaft;
import flugsuche.bean.Flughafen;
import flugsuche.bean.Flugzeugtyp;
import flugsuche.bean.Sitzplatz;
import flugsuche.bean.Angebot;
import flugsuche.bean.ComparatorFlug;

/**
 * Servlet implementation class Flugbuchung
 */
@WebServlet("/Flugbuchung")
public class Flugbuchung extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "jdbc/__default")
	private DataSource ds;
	private Connection connection;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Flugbuchung() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			connection = ds.getConnection();
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

		// Setzen der Flugvariablen

		boolean onlyHinflug = true;
		Flughafen abflughafen;
		Flughafen ankufthafen;
		Date hinflug = null;
		Date rueckflug = null;
		int adults = 1;
		int childs = 0;
		int babies = 0;

		SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");

		HttpSession session = request.getSession();

		Enumeration<String> e = request.getParameterNames();
		System.out.println("parastart");
		while (e.hasMoreElements()) {
			String string = (String) e.nextElement();
			System.out.println(string);

		}
		System.out.println("paraende");
		System.out.println(request.getParameter("hinflug"));

		// if Zweig: Eingabe über Startseite
		// else Zweig Eingabe über Flugsuche
		if (request.getParameter("hinflug") != null && request.getParameter("rueckflug") != null
				&& request.getParameter("datumhin") != null) {

			abflughafen = getAirport(request.getParameter("hinflug"));
			ankufthafen = getAirport(request.getParameter("rueckflug"));

			try {
				hinflug = format.parse(request.getParameter("datumhin"));
				System.out.println("flug: datim" + hinflug.toString());

			} catch (ParseException e1) {
				// TODO Auto-generated catch block

			}

		} else {

			// Suche der Flughäfen
			abflughafen = getAirport(request.getParameter("abflug"));

			/*
			 * if (abflughafen == null) { abflughafen = (Flughafen)
			 * session.getAttribute("abflughafen"); }
			 */

			ankufthafen = getAirport(request.getParameter("ankunft"));

			/*
			 * if (ankufthafen == null) { ankufthafen = (Flughafen)
			 * session.getAttribute("ankufthafen"); }
			 */

			if (abflughafen == null && ankufthafen == null) {
				ankufthafen = (Flughafen) session.getAttribute("ankufthafen");
				abflughafen = (Flughafen) session.getAttribute("abflughafen");
			}

			request.setAttribute("abflughafen", abflughafen);
			request.setAttribute("ankufthafen", ankufthafen);

			// Prüfung auf Flugart: nur Hinflug oder Hin- und Rueckflug
			if (request.getParameter("Flugart") != null) {
				onlyHinflug = request.getParameter("Flugart").equals("2");
				System.out.println("onlyHinflug" + onlyHinflug);
			} else {
				if (session.getAttribute("onlyHinflug") != null)
					onlyHinflug = (boolean) session.getAttribute("onlyHinflug");
			}

			// Konvertierung des Flugdatums
			try {
				if (request.getParameter("DateHinflug") != null && !request.getParameter("DateHinflug").equals(""))
					hinflug = format.parse(request.getParameter("DateHinflug"));
				else if (session.getAttribute("datumHin") != null) {
					hinflug = (Date) session.getAttribute("datumHin");
				} else {
					hinflug = new Date(System.currentTimeMillis());
				}
				if (!onlyHinflug)
					if (request.getParameter("DateRueckflug") != null)
						rueckflug = format.parse(request.getParameter("DateRueckflug"));
					else
						rueckflug = (Date) session.getAttribute("datumRueck");
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			// Prüfung der Anzahl der Passagiere
			if (request.getParameter("adults") != null) {
				adults = Integer.parseInt("" + request.getParameter("adults").charAt(0));
			} else {
				if (session.getAttribute("erwachsener") != null)
					adults = (int) session.getAttribute("erwachsener");

			}

			if (request.getParameter("children") != null) {
				childs = Integer.valueOf("" + request.getParameter("children").charAt(0));

			} else {
				if (session.getAttribute("childs") != null)
					childs = (int) session.getAttribute("childs");
			}

			if (request.getParameter("babies") != null) {
				babies = Integer.valueOf("" + request.getParameter("babies").charAt(0));
			} else {
				if (session.getAttribute("babies") != null)
					babies = (int) session.getAttribute("babies");

			}

		}

		// Speicherung der Flugdaten in der Session
		session.setAttribute("abflughafen", abflughafen);
		session.setAttribute("ankufthafen", ankufthafen);
		session.setAttribute("onlyHinflug", onlyHinflug);

		session.setAttribute("datumHin", hinflug);
		session.setAttribute("datumRueck", rueckflug);

		session.setAttribute("erwachsener", adults);
		session.setAttribute("childs", childs);
		session.setAttribute("babies", babies);

		// Suche nach passenden Flügen: Unterscheidung Hin- und Rückflug
		if (abflughafen != null && ankufthafen != null && hinflug != null) {

			List<Flug> direktHin = getDirectFlug(abflughafen, ankufthafen, hinflug);
			Collections.sort(direktHin, ComparatorFlug.getComparatorPreis());
			Map<Date, Double> minPreisMap = getMinPreisPerDate(abflughafen, ankufthafen, hinflug);

			List<Flug> direktRueck = null;
			if (!onlyHinflug) {
				direktRueck = getDirectFlug(ankufthafen, abflughafen, rueckflug);
				Collections.sort(direktRueck, ComparatorFlug.getComparatorPreis());
				Map<Date, Double> minPreisMapRueck = getMinPreisPerDate(ankufthafen, abflughafen, rueckflug);
				session.setAttribute("mapRueck", minPreisMapRueck);
				session.setAttribute("direktflugRueck", direktRueck);

			} else {
				session.setAttribute("direktflugRueck", null);
			}

			session.setAttribute("map", minPreisMap);
			session.setAttribute("direktflug", direktHin);
			try {
				connection.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} else {
			session.setAttribute("map", null);
			session.setAttribute("direktflug", null);
			session.setAttribute("mapRueck", null);
			session.setAttribute("direktflugRueck", null);
		}
		calculateMinMax(request);
		RequestDispatcher dispatcher = request.getRequestDispatcher("html/Flugsuche.jsp");
		dispatcher.forward(request, response);

	}

	private Map<Date, Double> getMinPreisPerDate(Flughafen abFlughafen, Flughafen anFlughafen, Date datum) {

		String statement = "SELECT date(abflugzeit) as abflugdatum ,MIN(preis) as minPreis,MAX(preis) as maxPreis from flug where fk_abflughafen = ? and fk_anflughafen = ? and date(abflugzeit) between ? and ? and date(abflugzeit)>= now() group by date(abflugzeit) order by abflugzeit asc ";
		Map<Date, Double> minPreis = new TreeMap<>();
		Map<Date, Double> maxPreis = new TreeMap<>();

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(statement);
			preparedStatement.setInt(1, abFlughafen.getId());
			preparedStatement.setInt(2, anFlughafen.getId());
			preparedStatement.setDate(3, new java.sql.Date(datum.getTime() - 86400000L * 15));
			preparedStatement.setDate(4, new java.sql.Date(datum.getTime() + 86400000L * 15));

			ResultSet result = preparedStatement.executeQuery();
			System.out.println(preparedStatement.toString());
			while (result.next()) {
				minPreis.put(result.getDate("abflugdatum"), result.getDouble("minPreis"));
				maxPreis.put(result.getDate("abflugdatum"), result.getDouble("maxPreis"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return minPreis;

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

	private Flughafen getAirport(String code) {

		String statement = "SELECT * FROM FLUGHAFEN WHERE ORT = ?";

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(statement);
			preparedStatement.setString(1, code);
			ResultSet result = preparedStatement.executeQuery();
			Flughafen hafen = null;
			if (result.next()) {
				hafen = new Flughafen();
				hafen.setId(result.getInt("flughafenid"));
				hafen.setKuerzel(result.getString("kuerzel"));
				hafen.setLand(result.getString("land"));
				hafen.setOrt(code);
				hafen.setZeitzone((Double.valueOf(result.getBigDecimal("zeitzone").toString())));
				System.out.println(hafen.getOrt());
			}
			System.out.println(preparedStatement.toString());

			return hafen;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private Flugzeugtyp getFlugzeugTyp(int id) {

		String statement = "select * from flugzeugtyp where flugzeugtypid = ?";

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(statement);
			preparedStatement.setInt(1, id);
			ResultSet result = preparedStatement.executeQuery();

			if (result.next()) {
				Flugzeugtyp typ = new Flugzeugtyp();

				typ.setBezeichnung(result.getString("bezeichnung"));
				typ.setSeatsFirstClass(result.getInt("anzahlSitzplaetzeFirstClass"));
				typ.setSeatsEconomy(result.getInt("anzahlSitzplaetzeEconomy"));
				typ.setId(id);
				typ.setGesellschaft(getFluggesellschaft(result.getInt("fk_flugzeuggesellschaft")));
				return typ;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	private List<Angebot> getAngebote(Flug flug) {

		String sql = "SELECT * FROM angebot WHERE fk_flug = ? ";
		List<Angebot> listAngebot = new ArrayList<Angebot>();

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, flug.getId());

			ResultSet result = preparedStatement.executeQuery();

			while (result.next()) {
				Angebot angebot = new Angebot();
				angebot.setId(result.getInt("angebotid"));
				angebot.setPreis(result.getDouble("preis"));

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

	private List<Sitzplatz> getSitzplaetze(Flug flug) {

		String sql = "SELECT * FROM sitzplatz WHERE fk_flug = ? ";
		List<Sitzplatz> listSitzplatz = new ArrayList<Sitzplatz>();

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, flug.getId());

			ResultSet result = preparedStatement.executeQuery();

			while (result.next()) {
				Sitzplatz platz = new Sitzplatz();
				platz.setId(result.getInt("sitzplatzid"));
				platz.setFirstClass(result.getBoolean("istFirstClass"));
				platz.setStatus(result.getString("status"));

				listSitzplatz.add(platz);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listSitzplatz;
	}

	private Fluggesellschaft getFluggesellschaft(int id) {
		String statement = "select * from fluggesellschaft where fluggesellschaftid = ?";

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(statement);
			preparedStatement.setInt(1, id);
			ResultSet result = preparedStatement.executeQuery();

			if (result.next()) {
				Fluggesellschaft gesellschaft = new Fluggesellschaft();
				gesellschaft.setBezeichnung(result.getString("bezeichnung"));
				gesellschaft.setId(id);
				return gesellschaft;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private List<Flug> getDirectFlug(Flughafen abFlughafen, Flughafen anFlughafen, Date datum) {

		String sql = "SELECT * FROM flug  WHERE fk_abflughafen = ? and fk_anflughafen = ? and date(abflugzeit) = ?";
		List<Flug> listDirektFluege = new ArrayList<Flug>();

		try {

			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, abFlughafen.getId());
			preparedStatement.setInt(2, anFlughafen.getId());
			preparedStatement.setTimestamp(3, new java.sql.Timestamp(datum.getTime()));
			System.out.println(preparedStatement.toString());
			ResultSet result = preparedStatement.executeQuery();

			while (result.next()) {
				Flug flug = new Flug();
				flug.setId(result.getInt("flugid"));
				flug.setAbflugzeit(new Timestamp(result.getTimestamp("abflugzeit").getTime()));

				flug.setAbFlughafen(abFlughafen);
				flug.setAnFlughafen(anFlughafen);
				flug.setFlugdauer(new Timestamp(result.getTime("fugdauer").getTime()));
				flug.setPreis(result.getDouble("preis"));
				flug.setFlugzeugtyp(getFlugzeugTyp(result.getInt("fk_flugzeugtyp")));

				flug.setSitzplatzListe(getSitzplaetze(flug));
				flug.setAngebotListe(getAngebote(flug));
				flug.calculatePreis();
				listDirektFluege.add(flug);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listDirektFluege;

	}

	private void calculateMinMax(HttpServletRequest request) {
		HttpSession session = request.getSession();

		List<Flug> direktflug = (List<Flug>) session.getAttribute("direktflug");
		List<Flug> direktflugRueck = (List<Flug>) session.getAttribute("direktflugRueck");
		DateFormat simDateFormat = new SimpleDateFormat("HH:mm");
		Date flugHin = (Date) session.getAttribute("datumHin");
		boolean onlyHinflug = (boolean) session.getAttribute("onlyHinflug");
		Timestamp flugdauerHinMin = new Timestamp(86400000L);
		Timestamp flugdauerHinMax = new Timestamp(1L);
		Timestamp abflugHinMin = new Timestamp(100 * 365 * 86400000L);
		Timestamp abflugHinMax = new Timestamp(1L);
		double minPrice = 99999999;
		double maxPrice = 0;
		Timestamp flugdauerRueckMin = new Timestamp(86400000L);
		Timestamp flugdauerRueckMax = new Timestamp(1L);
		Timestamp abflugRueckMin = new Timestamp(100 * 365 * 86400000L);
		Timestamp abflugRueckMax = new Timestamp(1L);
		double minPriceRueck = 99999999;
		double maxPriceRueck = 0;
		List<Fluggesellschaft> gesellschaftList = new ArrayList<>();
		if (direktflug != null)
			for (Flug flug : direktflug) {
				if (flugdauerHinMin.after(flug.getFlugdauer()))
					flugdauerHinMin = flug.getFlugdauer();
				if (flugdauerHinMax.before(flug.getFlugdauer()))
					flugdauerHinMax = flug.getFlugdauer();
				if (abflugHinMax.before(flug.getAbflugzeit()))
					abflugHinMax = flug.getAbflugzeit();
				if (abflugHinMin.after(flug.getAbflugzeit()))
					abflugHinMin = flug.getAbflugzeit();
				if (minPrice > flug.getPreis())
					minPrice = flug.getPreis();
				if (maxPrice < flug.getPreis())
					maxPrice = flug.getPreis();
				if (!gesellschaftList.contains(flug.getFlugzeugtyp().getGesellschaft())) {
					gesellschaftList.add(flug.getFlugzeugtyp().getGesellschaft());
				}
			}

		request.setAttribute("flugdauerHinMin", flugdauerHinMin);
		request.setAttribute("flugdauerHinMax", flugdauerHinMax);
		request.setAttribute("abflugHinMax", abflugHinMax);
		request.setAttribute("abflugHinMin", abflugHinMin);
		request.setAttribute("minPrice", minPrice);
		request.setAttribute("maxPrice", maxPrice);

		if (direktflugRueck != null)
			for (Flug flug : direktflugRueck) {
				if (flugdauerRueckMin.after(flug.getFlugdauer()))
					flugdauerRueckMin = flug.getFlugdauer();
				if (flugdauerRueckMax.before(flug.getFlugdauer()))
					flugdauerRueckMax = flug.getFlugdauer();
				if (abflugRueckMax.before(flug.getAbflugzeit()))
					abflugRueckMax = flug.getAbflugzeit();
				if (abflugRueckMin.after(flug.getAbflugzeit()))
					abflugRueckMin = flug.getAbflugzeit();
				if (minPriceRueck > flug.getPreis())
					minPriceRueck = flug.getPreis();
				if (maxPriceRueck < flug.getPreis())
					maxPriceRueck = flug.getPreis();
				if (!gesellschaftList.contains(flug.getFlugzeugtyp().getGesellschaft())) {
					gesellschaftList.add(flug.getFlugzeugtyp().getGesellschaft());
				}
			}
		
		request.setAttribute("flugdauerRueckMin", flugdauerRueckMin);
		request.setAttribute("flugdauerRueckMax", flugdauerRueckMax);
		request.setAttribute("abflugRueckMax", abflugRueckMax);
		request.setAttribute("abflugRueckMin", abflugRueckMin);
		request.setAttribute("minPriceRueck", minPriceRueck);
		request.setAttribute("maxPriceRueck", maxPriceRueck);
		request.setAttribute("gesellschaftList", gesellschaftList);
	}

}
