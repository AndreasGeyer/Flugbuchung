package flugsuche.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

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
import flugsuche.bean.Sitzplatz;

/**
 * Servlet implementation class SitzplatzSpeichern
 */
@WebServlet("/SitzplatzSpeichern")
public class SitzplatzSpeichern extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SitzplatzSpeichern() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Buchung buchung = (Buchung) session.getAttribute("Buchung");

		Flug hinflug = buchung.getHinflug();
		Flug rueckflug = buchung.getRueckflug();

		int counthin = 1;
		int countrueck = 1;

		for (int i = 0; i < buchung.getPositionen().size(); i++) {
			Buchungsposition pos = buchung.getPositionen().get(i);
			if (pos.getFlug().getId() == hinflug.getId()) {
				if (pos.getSitzplatz() != null) {
					Sitzplatz s = pos.getSitzplatz();
					if(request.getParameter("Sitzplatz" + counthin + "H")!=null)
						s.setId(Integer.parseInt(request.getParameter("Sitzplatz" + counthin + "H")));
					counthin++;
				}
			}
			if (rueckflug != null) {
				if (pos.getFlug().getId() == rueckflug.getId()) {
					if (pos.getSitzplatz() != null) {
						Sitzplatz s = pos.getSitzplatz();
						s.setId(Integer.parseInt(request.getParameter("Sitzplatz" + countrueck + "R")));
						countrueck++;
					}
				}
			}
		}
		/*
		final PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<body>");
		for (int i = 0; i < buchung.getPositionen().size(); i++) {
			if (buchung.getPositionen().get(i).getSitzplatz() != null)
				out.println(buchung.getPositionen().get(i).getSitzplatz().getId());

		}
		out.println("</body>");
		out.println("</html>");*/
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
