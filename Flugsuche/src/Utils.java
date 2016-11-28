import java.io.PrintWriter;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.sql.DataSource;

import flugsuche.annotation.column;
import flugsuche.annotation.table;
import flugsuche.bean.Flughafen;

public class Utils {

	@Resource(lookup = "jdbc/MyTestSQLPool")
	private DataSource ds;

	public static void persist(DataSource dataSource, Object persistent) {
		try {
			Connection con = dataSource.getConnection();
			Class persClass = persistent.getClass();
			Annotation[] t = persClass.getAnnotationsByType(table.class);
			Field[] coloumnName = persClass.getDeclaredFields();

			String statement = "INSERT INTO " + ((table) t[0]).name() + "(";
			String values = "VALUES(";
			PreparedStatement preparedStatement = con.prepareStatement(null);

			for (Field field : coloumnName) {
				Annotation[] annotation = field.getAnnotations();
				Annotation ann;
				if (annotation[0] instanceof column) {

					ann = (flugsuche.annotation.column) annotation[0];
					statement = statement + ((column) ann).name() + ",";
					values = values + persClass.getMethod("get" + getName(field)).invoke(persistent).toString();

					persClass.getMethod("get" + getName(field)).invoke(persistent).toString();
				}
			}

		} catch (Exception e) {
			// TODO: handle exception

		}

	}

	private static String getName(Field field) {

		char firstLetter = (char) (field.getName().charAt(0) + 20);
		return Character.toString(firstLetter) + field.getName().substring(1);
	}
}
// public List<Flughafen> suchen(PrintWriter out) throws ServletException {
//
// List<Flughafen> flughaefen = new ArrayList<Flughafen>();
//
// try (Connection con = ds.getConnection();
// PreparedStatement pstmt = con.prepareStatement("select * from flughafen")) {
// try (ResultSet rs = pstmt.executeQuery()) {
// while (rs != null && rs.next()) {
// Flughafen fh = new Flughafen();
// fh.setId(rs.getInt("flughafenid"));
// fh.setOrt(rs.getString("ort"));
// fh.setKuerzel(rs.getString("kuerzel"));
// fh.setZeitzone(rs.getDouble("zeitzone"));
// flughaefen.add(fh);
//
// // fh.getClass().getann
// }
//
// }
// } catch (Exception ex) {
// throw new ServletException(ex.getMessage());
// }
// return flughaefen;
