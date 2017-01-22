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

import com.mysql.jdbc.Statement;

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
		
		Kunde k= null;
		try {
			k = setUser(request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//was macht das?
		
		String idStr = k.getId()+"";
		while(idStr.length()<8){
			idStr = "0" + idStr;
		}
		Cookie loginCookie = new Cookie("kundenid", idStr);
		loginCookie.setMaxAge(30*600);
		response.addCookie(loginCookie);
		response.sendRedirect(request.getContextPath() + "/html/Startseite.jsp");
	}

	public Kunde setUser(HttpServletRequest request) throws ParseException {

		Kunde k = new Kunde();
		
		String[] generatedKeys = new String[] {"id"};
		
		String anrede=request.getParameter("anrede"); 
		String titel=request.getParameter("titel"); 
		System.out.println("Vorname: " + request.getParameter("vorname"));
		String vorname=request.getParameter("vorname"); 
		String nachname=request.getParameter("nachname");
		System.out.println("Geburtsdatum: " + request.getParameter("gebdatum"));
		Date gebdatum=new Date(new SimpleDateFormat("dd.MM.yyyy").parse(request.getParameter("gebdatum")).getTime());
		String passwort=request.getParameter("passwort");
		String email=request.getParameter("email");
		String strasse=request.getParameter("strasse");
		String hausnr=request.getParameter("hausnr");
		String plz=request.getParameter("plz");
		String ort=request.getParameter("ort");
		
		try {
			Connection connection = ds.getConnection();
			PreparedStatement pstmt = connection.prepareStatement("INSERT INTO kunde (anrede, titel, vorname, nachname, geburtsdatum,  email, passwort, strasse, hausnummer, postleitzahl, ort) values(?,?,?,?, ?, ?, ?, ?, ?, ?, ?)", generatedKeys);
			
		      //mit Prepared Statement ID mit Übergeben!!

		      pstmt.setString(1, anrede); 
		      pstmt.setString(2,titel);
		      pstmt.setString(3, vorname);
		      pstmt.setString(4, nachname);
		      pstmt.setDate(5, gebdatum);
		      pstmt.setString(7, passwort);
		      pstmt.setString(6, email);
		      pstmt.setString(8, strasse);
		      pstmt.setString(9, hausnr);
		      pstmt.setString(10, plz);
		      pstmt.setString(11, ort);
		      pstmt.executeUpdate();
		      
		      ResultSet rs = pstmt.getGeneratedKeys();
		      int id = 0;
		      while(rs.next()){
		    	  k.setId(rs.getInt(1));
		  		
		      }
			   
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return k;
		
	
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
