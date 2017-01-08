package flugsuche.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import flugsuche.bean.Kunde;

/**
 * Servlet implementation class UserAendern
 */
@WebServlet("/UserAendern")
public class UserAendern extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserAendern() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
		System.out.println(id);
		try {
			updateUser(Integer.parseInt(id), request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/UserLaden");

	}

	public boolean updateUser(int id, HttpServletRequest request) throws ParseException {
		String statement = "update kunde set ";
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			statement += names.nextElement() + " = ? , ";
			
		}
		statement = statement.substring(0, statement.length() - 3) + " where kundeid = ?";
		System.out.println(statement);
		try (Connection con = ds.getConnection(); PreparedStatement pstmt = con.prepareStatement(statement);
				) {
			names = request.getParameterNames();
			int i = 1;
			while (names.hasMoreElements()) {
				String n = names.nextElement();
				if (n.equals("geburtsdatum")) {
					pstmt.setDate(i,
							new Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter(n)).getTime()));
				}else if (n.equals("istPremium")) {
					System.out.println("Premium");
				} else {
					pstmt.setString(i, request.getParameter(n));
					System.out.println(n + " : " + request.getParameter(n) + ";" + i);
				}

				i++;
			}
			pstmt.setInt(i, id);
			System.out.println(pstmt.executeUpdate());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
}
