package flugsuche.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import flugsuche.bean.Buchung;
import flugsuche.bean.Buchungsposition;
import flugsuche.bean.Flug;
import flugsuche.bean.Kunde;
import flugsuche.bean.Zusatzleistung;

/**
 * Servlet implementation class PassagierSpeichern
 * Autor: Magdalena Hora
 */
@WebServlet("/PassagierSpeichern")
public class PassagierSpeichern extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassagierSpeichern() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Buchung buchung = (Buchung) session.getAttribute("Buchung");
		
		List<Buchungsposition> positionen = buchung.getPositionen();
		
		int adult = (int) session.getAttribute("erwachsener");
		int baby = (int) session.getAttribute("babies");
		int kind = (int) session.getAttribute("childs");
		
		int adultzaehler = 1;
		int babyzaehler = 1;
		int kindzaehler = 1;
		
		for(int i = 0; i<positionen.size(); i++){
			Buchungsposition pos = positionen.get(i);
			if(pos.getZusatzleistung() == null){
				if(adult < adultzaehler && kind < kindzaehler && baby < babyzaehler){
					adultzaehler = 1;
					babyzaehler = 1;
					kindzaehler = 1;
				}
				if(adultzaehler <= adult){
					pos.setPassagierVorname(request.getParameter("vornameE" + adultzaehler));
					pos.setPassagierNachname(request.getParameter("nachnameE" + adultzaehler));
					try {
						pos.setGeburtsdatum(new Date(new SimpleDateFormat("dd.MM.yyyy").parse(request.getParameter("GebdatumE" + adultzaehler)).getTime()));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					adultzaehler++;
				}
				else if(kindzaehler <= kind){
					System.out.println("Anzahl Kind: " +kindzaehler);
					pos.setPassagierVorname(request.getParameter("vornameK" + kindzaehler));
					pos.setPassagierNachname(request.getParameter("nachnameK" + kindzaehler));
					try {
						pos.setGeburtsdatum(new Date(new SimpleDateFormat("dd.MM.yyyy").parse(request.getParameter("GebdatumK" + kindzaehler)).getTime()));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					kindzaehler++;
				}
				else if(babyzaehler <= baby){
					pos.setPassagierVorname(request.getParameter("vornameB" + babyzaehler));
					pos.setPassagierNachname(request.getParameter("nachnameB" + babyzaehler));
					try {
						pos.setGeburtsdatum(new Date(new SimpleDateFormat("dd.MM.yyyy").parse(request.getParameter("GebdatumB" + babyzaehler)).getTime()));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					babyzaehler++;
				}
				
			}
		}
		
		
		/*
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
			if(id != "")
			k = getUser(Integer.parseInt(id), response);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		RequestDispatcher dispatcher = request.getRequestDispatcher("html/Passagier.jsp");
		dispatcher.forward(request, response);

		*/
		response.sendRedirect(request.getContextPath() + "/SitzplatzLaden");
	}





	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
