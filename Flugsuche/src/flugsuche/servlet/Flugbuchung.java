package flugsuche.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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

/**
 * Servlet implementation class Flugbuchung
 */
@WebServlet("/Flugbuchung")
public class Flugbuchung extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

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

		// Setzen der Flugvariablen

		boolean onlyHinflug = true;
		Flughafen abflughafen;
		Flughafen ankufthafen;
		Date hinflug = null;
		Date rueckflug = null;
		int adults;
		int childs;
		int babies;

		SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");

		HttpSession session = request.getSession();

		Enumeration<String> e = request.getParameterNames();
		System.out.println("parastart");
		while (e.hasMoreElements()) {
			String string = (String) e.nextElement();
			System.out.println(string);

		}
		System.out.println("paraende");

		if (request.getParameter("hinflug") != null && request.getParameter("rueckflug") != null
				&& request.getParameter("datumhin") != null) {

			abflughafen = getAirport(request.getParameter("hinflug"));
			ankufthafen = getAirport(request.getParameter("rueckflug"));

			try {
				hinflug = format.parse(request.getParameter("datumhin"));

			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				response.sendRedirect("Startseite.jsp");

			}

		} else {
			abflughafen = getAirport(request.getParameter("abflug"));
			ankufthafen = getAirport(request.getParameter("ankunft"));
			request.setAttribute("abflughafen", abflughafen);
			request.setAttribute("ankufthafen", ankufthafen);

			if (request.getParameter("Flugart") != null) {
				onlyHinflug = request.getParameter("Flugart").equals("2");
				System.out.println("onlyHinflug" + onlyHinflug);
			}

			try {
				hinflug = format.parse(request.getParameter("DateHinflug"));
				if (!onlyHinflug)
					rueckflug = format.parse(request.getParameter("DateRueckflug"));
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			adults = Integer.valueOf(request.getParameter("adults").charAt(0));
			childs = Integer.valueOf(request.getParameter("children").charAt(0));
			babies = Integer.valueOf(request.getParameter("babies").charAt(0));
		}

		request.setAttribute("abflughafen", abflughafen);
		request.setAttribute("ankufthafen", ankufthafen);
		request.setAttribute("onlyHinflug", onlyHinflug);
		request.setAttribute("datumHin", hinflug);

		List<Flug> direkt = getDirectFlug(abflughafen, ankufthafen, hinflug);
		Map<Date, Double> minPreisMap = getMinPreisPerDate(abflughafen, ankufthafen, hinflug);

		session.setAttribute("map", minPreisMap);
		session.setAttribute("direktflug", direkt);

		RequestDispatcher dispatcher = request.getRequestDispatcher("html/Flugsuche.jsp");
		dispatcher.forward(request, response);

	}

	private Map<Date, Double> getMinPreisPerDate(Flughafen abFlughafen, Flughafen anFlughafen, Date datum) {

		String statement = "SELECT date(abflugzeit) as abflugdatum ,MIN(preis) as minPreis,MAX(preis) as maxPreis from flug where fk_abflughafen = ? and fk_anflughafen = ? and date(abflugzeit) between ? and ? group by date(abflugzeit) order by abflugzeit desc ";
		Map<Date, Double> minPreis = new HashMap<>();
		Map<Date, Double> maxPreis = new HashMap<>();
		Connection connection;
		try {
			connection = ds.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(statement);
			preparedStatement.setInt(1, abFlughafen.getId());
			preparedStatement.setInt(2, anFlughafen.getId());
			preparedStatement.setDate(3, new java.sql.Date(datum.getTime() - 86400000L * 15));
			preparedStatement.setDate(4, new java.sql.Date(datum.getTime() + 86400000L * 15));
			System.out.println(preparedStatement.toString());
			ResultSet result = preparedStatement.executeQuery();

			while (result.next()) {
				minPreis.put(result.getDate("abflugdatum"), result.getDouble("minPreis"));
				maxPreis.put(result.getDate("abflugdatum"), result.getDouble("maxPreis"));

			}
			connection.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return minPreis;

	}

	private void calculateTicketpreis() {

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

		Connection connection;
		try {
			connection = ds.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(statement);
			preparedStatement.setString(1, code);
			ResultSet result = preparedStatement.executeQuery();
			Flughafen hafen = null;
			if (result.next()) {
				hafen = new Flughafen();
				hafen.setId(result.getInt("flughafenid"));
				hafen.setKuerzel("kuerzel");
				hafen.setLand(result.getString("land"));
				hafen.setOrt(code);
				hafen.setZeitzone((Double.valueOf(result.getBigDecimal("zeitzone").toString())));
				System.out.println(hafen.getOrt());
			}
			System.out.println(preparedStatement.toString());

			connection.close();
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

		Connection connection;
		try {
			connection = ds.getConnection();
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
			connection.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	private Fluggesellschaft getFluggesellschaft(int id) {
		String statement = "select * from fluggesellschaft where fluggesellschaftid = ?";

		Connection connection;
		try {
			connection = ds.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(statement);
			preparedStatement.setInt(1, id);
			ResultSet result = preparedStatement.executeQuery();
			System.out.println(preparedStatement.toString());

			if (result.next()) {
				Fluggesellschaft gesellschaft = new Fluggesellschaft();
				gesellschaft.setBezeichnung(result.getString("bezeichnung"));
				gesellschaft.setId(id);
				return gesellschaft;
			}
			connection.close();

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

		String sql = "SELECT * FROM flug WHERE fk_abflughafen = ? and fk_anflughafen = ? and date(abflugzeit) = ?";
		List<Flug> listDirektFluege = new ArrayList<Flug>();

		Connection connection;
		try {
			connection = ds.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, abFlughafen.getId());
			preparedStatement.setInt(2, anFlughafen.getId());
			preparedStatement.setDate(3, new java.sql.Date(datum.getTime()));
			System.out.println(preparedStatement.toString());
			ResultSet result = preparedStatement.executeQuery();

			while (result.next()) {
				Flug flug = new Flug();
				flug.setId(result.getInt("flugid"));
				flug.setAbflugzeit(new Date(result.getTimestamp("abflugzeit").getTime()));
	
				flug.setAbFlughafen(abFlughafen);
				flug.setAnFlughafen(anFlughafen);
				flug.setFlugdauer(new Date(result.getTime("fugdauer").getTime()));
				flug.setPreis(result.getDouble("preis"));
				flug.setFlugzeugtyp(getFlugzeugTyp(result.getInt("fk_flugzeugtyp")));

				listDirektFluege.add(flug);

			}

			connection.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listDirektFluege;

	}

}
