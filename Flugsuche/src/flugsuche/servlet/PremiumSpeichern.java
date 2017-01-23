package flugsuche.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import flugsuche.bean.Kunde;

/**
 * Servlet implementation class PremiumSpeichern
 */
@WebServlet("/PremiumSpeichern")
public class PremiumSpeichern extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PremiumSpeichern() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			updateUser(Integer.parseInt(id), request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/UserLaden");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public boolean updateUser(int id, HttpServletRequest request) throws ParseException {
		String statement = "update kunde set istPremium = true where kundeid = ?";
		try (Connection con = ds.getConnection(); PreparedStatement pstmt = con.prepareStatement(statement);
				) {
			pstmt.setInt(1, id);
			
			System.out.println(pstmt.executeUpdate());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

}
