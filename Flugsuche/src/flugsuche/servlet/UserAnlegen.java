package flugsuche.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

/**
 * Servlet implementation class UserAnlegen
 */
@WebServlet("/UserAnlegen")
public class UserAnlegen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAnlegen() {
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
		Cookie cookies[] = request.getCookies();
		String id = "";
		for (int i = 0; i < cookies.length; i++) {
			Cookie c = cookies[i];
			if (c.getName().equals("kundenid")) {
				id = c.getValue();
			}
		}
		try {
			k = setUser(Integer.parseInt(id), response);
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
	}

	public Kunde setUser(int id, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Kunde kunde = null;
		
		String anrede=request.getParameter("anrede");  
		String titel=request.getParameter("titel");  
		String vorname=request.getParameter("vorname");  
		String nachname=request.getParameter("nachname");  
		String geburtsdatum =request.getParameter("bday");  
		String passwort =request.getParameter("passwort");  
		String strasse =request.getParameter("strasse");
		String plz =request.getParameter("plz");
		String ort =request.getParameter("ort");
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("select * from kunde where kundeid = ?");) {
			pstmt.setInt(1, id);
			
			pstmt.setString(2,anrede);
			pstmt.setString(3,titel);
			pstmt.setString(4,vorname);
			pstmt.setString(5,nachname);
			pstmt.setString(6,geburtsdatum);
			pstmt.setString(7,passwort);
			pstmt.setString(8,strasse);
			pstmt.setString(9,plz);
			pstmt.setString(10,ort);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return kunde;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
