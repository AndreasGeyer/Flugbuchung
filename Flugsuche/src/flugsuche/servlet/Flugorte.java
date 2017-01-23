package flugsuche.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TimeZone;

import javax.annotation.Resource;
import javax.print.attribute.standard.DateTimeAtCompleted;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.swing.JOptionPane;

import com.mysql.jdbc.JDBC4PreparedStatement;
import com.mysql.jdbc.Statement;

import flugsuche.bean.Flughafen;

/**
 * Servlet implementation class Flugorte
 * Author Bauer Jürgen
 */
@WebServlet("/Flugorte")
public class Flugorte extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Flugorte() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
	
		HttpSession session = request.getSession();
		List<Flughafen> flughaefen = (ArrayList<Flughafen>) session.getAttribute("airports");

		if (flughaefen == null) {
			flughaefen = selectAllAirports(request);
			session.setAttribute("airports", flughaefen);
		} else {
			flughaefen = selectAllAirports(request);
			session.setAttribute("airports", flughaefen);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("html/Flughafen.jsp");
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

	private List<Flughafen> selectAllAirports(HttpServletRequest request) {

		try {
			Enumeration<String> enumeration = request.getParameterNames();

			Connection con = ds.getConnection();
			PreparedStatement statement = con
					.prepareStatement("SELECT * FROM flughafen WHERE LOWER(ort) LIKE ? ORDER BY ort ASC");

			String flughafen_Bezeichnung = (String) request.getParameter(request.getParameterNames().nextElement())
					.toLowerCase();
			statement.setString(1, "%" + flughafen_Bezeichnung + "%");
		
			ResultSet result = statement.executeQuery();
			con.close();
			return fillFlughafenList(result);

		} catch (SQLException e) {

			e.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();
		}
		return new ArrayList<>();
	}

	private List<Flughafen> selectPossibleAirports(boolean abflug) {
		String statement = null;
		if (abflug) {
			statement = "SELECT DISTINCT flughafen.* FROM flug  join  flughafen on flug.fk_anflughafen = flughafen.flughafenid where flug.fk_abflughafen = ?";
		} else {
			statement = "SELECT DISTINCT flughafen.* FROM flug  join  flughafen on flug.fk_abflughafen = flughafen.flughafenid where flug.fk_anflugghafen = ?";
		}

		Connection connection;
		try {
			connection = ds.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(statement);
			ResultSet result = preparedStatement.executeQuery();
			connection.close();
			return fillFlughafenList(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private List<Flughafen> fillFlughafenList(ResultSet result) {

		List<Flughafen> listFlughafen = new ArrayList<Flughafen>();

		try {
			while (result.next()) {
				Flughafen flughafen = new Flughafen();

				flughafen.setId(result.getInt("flughafenid"));
				flughafen.setKuerzel(result.getString("kuerzel"));
				flughafen.setOrt(result.getString("ort"));
				flughafen.setLand(result.getString("land"));

				listFlughafen.add(flughafen);
			}
			return listFlughafen;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}



}
