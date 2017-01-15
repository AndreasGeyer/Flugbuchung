package flugsuche.servlet;

import java.io.IOException;
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import flugsuche.bean.Kunde;

/**
 * Servlet implementation class UserAnlegen
 * Autor: Magdalena Hora
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
		
		Kunde k = null;
		
		//setzen der Cookies in eine Liste
		Cookie cookies[] = request.getCookies();
		String id = "";
		for (int i = 0; i < cookies.length; i++) {
			Cookie c = cookies[i];
			//Cookieid wird auf Kundenid gesetzt
			if (c.getName().equals("kundenid")) {
				id = c.getValue();
			}
		}
		System.out.println(id);
		//was macht das try?
		try {
			setUser(Integer.parseInt(id), request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//was macht das?
		response.sendRedirect(request.getContextPath() + "/UserAnlegen");
	}

	private void setUser(int id, HttpServletRequest request) throws ParseException {
		// TODO Auto-generated method stub

		//Wie geht das das er Passwortbe also die Bestätigung nicht mit speicher?
		
		//Paramenter einlesen 
		String statement = "UserAnlegen ";
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			statement += names.nextElement() + " = ? , ";
			
		}
		
		//Useranlegen request.getParameterNames() where kundeid=? 
		statement = statement.substring(0, statement.length() - 3) + " where kundeid = ?";
		System.out.println(statement);
		
		//Datenbankaufbau
		try (Connection con = ds.getConnection(); PreparedStatement pstmt = con.prepareStatement(statement);
				) {
			
			names = request.getParameterNames();
			int i = 1;

			//solange names noch nicht alle übergebenen Parameter durch hat weitermachen 
			while (names.hasMoreElements()) {
				String n = names.nextElement();
				if (n.equals("bday")) {
					//wenn der Parameter bday ist, dann soll er ein neues Datum setzen/ was ist parse?
					pstmt.setDate(i, new Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter(n)).getTime()));
				}
				 else {
					pstmt.setString(i, request.getParameter(n));
					System.out.println(n + " : " + request.getParameter(n) + ";" + i);
				}

				i++;
			}
			//warum als letztes die ID setzen? 
			pstmt.setInt(i, id);
			System.out.println(pstmt.executeUpdate());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
