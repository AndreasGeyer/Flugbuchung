package flugsuche.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String userID = "Test";
	private final String password = "test";
	
	@Resource(lookup="jdbc/__default")
	private DataSource ds;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Do Post");
		doGet(request, response);

	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// get request parameters for userID and password
		int id = 0;
		try{
			id = getUserId(request.getParameter("email"), request.getParameter("password"));
			String idStr = id+"";
			while(idStr.length()<8){
				idStr = "0" + idStr;
			}
			Cookie loginCookie = new Cookie("kundenid", idStr);
			loginCookie.setMaxAge(30*600);
			response.addCookie(loginCookie);
			response.sendRedirect("html/Startseite.jsp");
		}
		catch(Exception e){
			final PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>"); 
			out.println("<html>"); 
			out.println("<body>"); 
			out.println("<h3>" + e.getMessage() + "</h3>"); 
			e.printStackTrace();
			out.println("Datum: <b>" + new Date() + "/b");
			out.println("</body>");
			out.println("</html>");
		}
		

	}
	
	public int getUserId(String mail, String password) throws Exception{		
		int id = 0;
		
		try(
			Connection con = ds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(
					"select * from kunde where email = ? and passwort = ?");
		){
			pstmt.setString(1, mail);
			pstmt.setString(2, password);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()){
					id = rs.getInt("kundeid");
				}
				else{
					throw new Exception("Kunde " + mail + " nicht vorhanden oder Email falsch!");
				}
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

}