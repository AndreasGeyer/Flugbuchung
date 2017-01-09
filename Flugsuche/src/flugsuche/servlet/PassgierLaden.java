package flugsuche.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import flugsuche.bean.Kunde;
import flugsuche.bean.Passagier;
/**
 * Servlet implementation class PassgierLaden
 */
@WebServlet("/PassgierLaden")
public class PassgierLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassgierLaden() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Get Request");
		Kunde k = null;
		Passagier p = null;
		Cookie cookies[] = request.getCookies();
		String id = "";
		for (int i = 0; i < cookies.length; i++) {
			Cookie c = cookies[i];
			if (c.getName().equals("kundenid")) {
				id = c.getValue();
			}
		}
		try {
			//Stimmt das überhaupt??? 
			p = getPassagier(Integer.parseInt(id), response);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("kunde", k);
		if (k == null) {
			final PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<body>");
			out.println("<h3>" + "Kunde" + Integer.parseInt(id) + " Leer" + "</h3>");
			out.println("Datum: <b>" + new Date() + "/b");
			out.println("</body>");
			out.println("</html>");
			return;
		}
		System.out.println(request.getContextPath() + "/html/User.jsp");
		RequestDispatcher disp = request.getRequestDispatcher("/html/User.jsp");
		disp.forward(request, response);
		System.out.println("ZUENDE");

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	public Passagier getPassagier(int id, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		Passagier passagier = null;
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("select * from passagier where passagierid = ?");) {
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					passagier = new Passagier();
					passagier.setId(id);
					passagier.setVorname(rs.getString("vorname"));
					passagier.setNachname(rs.getString("nachname"));
					passagier.setGeburtsdatum(rs.getDate("geburtsdatum"));
				} else {

				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return passagier;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
