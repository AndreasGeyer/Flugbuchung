package flugsuche.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
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

import flugsuche.bean.Flughafen;

/**
 * Servlet implementation class Flugorte
 */
@WebServlet("/Flugorte")
public class Flugorte extends HttpServlet implements Comparator<Flughafen> {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "jdbc/MyTestSQLPool")
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
		System.out.println("aad");
		HttpSession session = request.getSession();
		List<Flughafen> flughaefen = (ArrayList<Flughafen>) session.getAttribute("airports");
		if (flughaefen == null) {
			flughaefen = selectAllAirports();
			session.setAttribute("airports", flughaefen);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Flughafen.jsp");
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

	private List<Flughafen> selectAllAirports() {

		try {
			Connection con = ds.getConnection();
			PreparedStatement statement = con.prepareStatement("SELECT * FROM flughafen");
			ResultSet result = statement.executeQuery();

		
			return fillFlughafenList(result);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return null;
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

	@Override
	public int compare(Flughafen o1, Flughafen o2) {
		// TODO Auto-generated method stub
		return 0;
	}

}
