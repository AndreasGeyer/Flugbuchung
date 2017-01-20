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
			System.out.println(statement.toString());
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

//	private void ss() {
//
//		String prep = "";
//		try {
//			Connection conn = ds.getConnection();
//			PreparedStatement ppp = conn.prepareStatement("SELECT * FROM myguests WHERE id = ?");
//		//	PreparedStatement lll = conn.prepareStatement("INSERT INTO myguests (id) values (?)");
//			Map[][] matrix = new Map[54][54];
//			for (int ii = 0; ii < 54; ii++)
//				for (int j = 0; j < 54; j++) {
//					ppp.setString(1, "" + ii + "," + j);
//					
//					
//					ResultSet set = ppp.executeQuery();
//					set.next();
//					if (set.getTime("preis") != null) {
//						matrix[ii][j] = new HashMap<>();
//					
//						matrix[ii][j].put("hours", set.getDouble("hours"));
//						Time kk = set.getTime("preis");
//						Calendar cal = Calendar.getInstance();
//						cal.setTimeInMillis(kk.getTime());
//						matrix[ii][j].put("zeit", cal);
//					}
//
//				}
//
//			for (int l = 42; l < 54; l++)
//				for (int k = 0; k < 54; k++) {
//
//					double zufall = Math.random();
//					int airlines = (int) (Math.random() * 4) + 1;
//					int wochentag = (int) (Math.random() * 5) + 1;
//					int wieoft = 1;
//					double zufallWieoft = Math.random();
//
//					if (0.0 < zufallWieoft && zufallWieoft <= 0.7)
//						wieoft = 1;
//					if (0.7 < zufallWieoft && zufallWieoft <= 0.95)
//						wieoft = 2;
//					if (0.95 < zufallWieoft && zufallWieoft <= 0.975)
//						wieoft = 3;
//					if (0.975 < zufallWieoft && zufallWieoft <= 1)
//						wieoft = 4;
//
//					if (0.0 < wochentag && wochentag <= 0.05)
//						wochentag = 1;
//					if (0.05 < wochentag && wochentag <= 0.2)
//						wochentag = 2;
//					if (0.2 < wochentag && wochentag <= 0.6)
//						wochentag = 3;
//					if (0.6 < wochentag && wochentag <= 0.8)
//						wochentag = 4;
//					if (0.8 < wochentag && wochentag <= 1)
//						wochentag = 5;
//
//					double S = Math.random();
//					double p = 0;
//					int max = 0, min = 0;
//					if (0 <= S && S <= 0.5) {
//						max = 3;
//						min = 1;
//						p = 155.97;
//					}
//					if (0.5 < S && S <= 0.8) {
//						max = 7;
//						min = 4;
//						p = 273.21;
//					}
//					if (0.8 < S) {
//						max = 13;
//						min = 8;
//						p = 323.01;
//					}
//					Random rn = new Random();
//					if (zufall > 0.6 && l != k) {
//
//						List list = new ArrayList<>();
//						Calendar time = GregorianCalendar.getInstance();
//						time.set(0, 0, 0, rn.nextInt((max - min) + 1) + min, (int) (Math.random() * 60), 0);
//
//						for (int airline = 0; airline < airlines; airline++) {
//
//							Calendar kalender = GregorianCalendar.getInstance();
//							kalender.set(2017, 0, (int) (Math.random() * 8) + 1, (int) (Math.random() * 23) + 6,
//									(int) (Math.random() * 60), 0);
//
//							Calendar klo = GregorianCalendar.getInstance();
//							klo.set(0, 0, 0, rn.nextInt((22 - 6) + 1) + 6, (int) (Math.random() * 60), 0);
//
//							Timestamp date = new Timestamp(kalender.getTimeInMillis());
//
//							int air = 0;
//							while (!list.contains(air)) {
//								air = (int) rn.nextInt(15) + 1;
//								list.add(air);
//							}
//
//							int counter = 0;
//							long lon = 1514761200000L;
//							Timestamp st = new Timestamp(lon);
//
//							double hour = 0;
//
//							if (matrix[l][k] != null) {
//
//								time = (Calendar) matrix[l][k].get("zeit");
//								hour = (double) matrix[l][k].get("hours");
//
//							} else {
//								matrix[l][k] = new HashMap<>();
//								matrix[k][l] = new HashMap<>();
//
//								Calendar c = Calendar.getInstance();
//								c.setTimeInMillis(time.getTimeInMillis());
//
//								hour = (p * time.get(Calendar.HOUR_OF_DAY) + p * (time.get(Calendar.MINUTE) / 60));
//								matrix[l][k].put("hours", hour);
//								matrix[l][k].put("zeit", c);
//								
//								PreparedStatement s1 = conn.prepareStatement("update MyGuests SET hours = ?, preis = ? WHERE id = ?");
//								s1.setDouble(1, hour);
//								s1.setTime(2, new Time(c.getTimeInMillis()));
//								s1.setString(3, l+","+k);
//								s1.execute();
//
//								Calendar clone = (Calendar) c.clone();
//								clone.setTimeInMillis(time.getTimeInMillis() + 1800000L);
//								matrix[k][l].put("zeit", clone);
//								matrix[k][l].put("hours", hour);
//								
//								PreparedStatement s2 = conn.prepareStatement("update MyGuests SET hours = ?, preis = ? WHERE id = ?");
//								s2.setDouble(1, hour);
//								s2.setTime(2, new Time(clone.getTimeInMillis()));
//								s2.setString(3, k+","+l);
//								s2.execute();
//							}
//
//							hour = hour * (0.95 + (Math.random() * (1.05 - 0.95)));
//							double preis = hour * (0.8 + (Math.random() * (1.2 - 0.8)));
//							preis = preis * (1 - ((air * 1.3 - 7) / 100));
//
//							while (date.before(st)) {
//								String sql = "INSERT INTO `flug`.`flug` (`abflugzeit`, `fugdauer`, `preis`, `fk_abflughafen`, `fk_anflughafen`, `fk_flugzeugtyp`) VALUES (?, ?, ?, ?, ?, ?)";
//
//								DecimalFormat df = new DecimalFormat("#.##");
//
//								for (int oft = 0; oft < wieoft; oft++) {
//									PreparedStatement preparedStatement = conn.prepareStatement(sql);
//									preparedStatement.setTimestamp(1, date);
//									preparedStatement.setTime(2, new Time(time.getTimeInMillis()));
//
//									double faktor = 0.9 + (Math.random() * (1.1 - 0.9));
//									preparedStatement.setBigDecimal(3, new BigDecimal(preis * faktor));
//									preparedStatement.setInt(4, l + 1);
//									preparedStatement.setInt(5, k + 1);
//									preparedStatement.setInt(6, 29 + air);
//									// prep = preparedStatement.
//									preparedStatement.execute();
//
//									// prep = prep
//									// +";"+((JDBC4PreparedStatement)preparedStatement).asSql();
//
//									kalender.setTimeInMillis(date.getTime());
//									kalender.set(Calendar.HOUR_OF_DAY, rn.nextInt((22 - 6) + 1) + 6);
//									kalender.set(Calendar.MINUTE, (int) (Math.random() * 60));
//									date = new Timestamp(kalender.getTimeInMillis());
//
//								}
//
//								counter++;
//
//								date.setDate(date.getDate() + wochentag);
//
//							}
//							wochentag = wochentag();
//							wieoft = oft();
//
//						}
//						// System.out.print(prep);
//
//					}
//				}
//		} catch (Exception e) {
//			System.out.println(prep);
//			e.printStackTrace();
//		}
//
//	}
//
//	public int wochentag() {
//		int wochentag = (int) (Math.random() * 5) + 1;
//		if (0.0 < wochentag && wochentag <= 0.1)
//			wochentag = 1;
//		if (0.1 < wochentag && wochentag <= 0.3)
//			wochentag = 2;
//		if (0.3 < wochentag && wochentag <= 0.7)
//			wochentag = 3;
//		if (0.7 < wochentag && wochentag <= 0.9)
//			wochentag = 4;
//		if (0.9 < wochentag && wochentag <= 1)
//			wochentag = 5;
//		return wochentag;
//	}
//
//	public int oft() {
//		double zufallWieoft = Math.random();
//		int wieoft = 0;
//		if (0.0 < zufallWieoft && zufallWieoft <= 0.5)
//			wieoft = 1;
//		if (0.5 < zufallWieoft && zufallWieoft <= 0.75)
//			wieoft = 2;
//		if (0.75 < zufallWieoft && zufallWieoft <= 0.90)
//			wieoft = 3;
//		if (0.9 < zufallWieoft && zufallWieoft <= 0.95)
//			wieoft = 4;
//		if (0.95 < zufallWieoft && zufallWieoft <= 1)
//			wieoft = 5;
//
//		return wieoft;
//	}

}
