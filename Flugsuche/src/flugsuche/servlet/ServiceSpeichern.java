package flugsuche.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import flugsuche.bean.Buchung;
import flugsuche.bean.Buchungsposition;
import flugsuche.bean.Flug;
import flugsuche.bean.Zusatzleistung;

/**
 * Servlet implementation class ServiceSpeichern
 */
@WebServlet("/ServiceSpeichern")
public class ServiceSpeichern extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServiceSpeichern() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Buchung buchung = (Buchung) session.getAttribute("Buchung");
		
		response.setCharacterEncoding("utf-8");
		
		Flug hin = buchung.getHinflug();
		Flug rueck = buchung.getRueckflug();

		String leistung = request.getParameter("leistung");
		if (leistung != null) {
			String[] leistungen = leistung.split(",");
			System.out.println(leistungen.toString());
			ArrayList<Buchungsposition> listPos = (ArrayList<Buchungsposition>) buchung.getPositionen();
			for (Buchungsposition position : listPos) {
				if (position.getZusatzleistung() != null) {
					listPos.remove(position);
				}
			}

			for (int i = 0; i < leistungen.length; i++) {
				Flug flug = null;

				if (!leistungen[i].equals("undefined")) {
					String string = leistungen[i].substring(0, leistungen[i].indexOf("_"));
					Zusatzleistung leist = null;
					if (leistungen[i].substring(leistungen[i].indexOf("_")).contains("Hinflug"))
						leist = hin.getZusatzleistung(Integer.parseInt(string));
					flug = hin;
					if (leist == null) {
						leist = rueck.getZusatzleistung(Integer.parseInt(string));
						flug = rueck;
					}

					if (leist != null) {
						Buchungsposition pos = new Buchungsposition();
						pos.setZusatzleistung(leist);
						pos.setFlug(flug);
						pos.setPreis(leist.getPreis());
						buchung.getPositionen().add(pos);
					}
				}
			}
		}

		session.setAttribute("Buchung", buchung);

		RequestDispatcher dispatcher = request.getRequestDispatcher("html/Zahlungsart.jsp");
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

}
