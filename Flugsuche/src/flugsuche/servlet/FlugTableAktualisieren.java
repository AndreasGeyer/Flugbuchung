package flugsuche.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

import flugsuche.bean.ComparatorFlug;
import flugsuche.bean.Flug;

/**
 * Servlet implementation class FlugTableAktualisieren
 */
@WebServlet("/FlugTableAktualisieren")
public class FlugTableAktualisieren extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FlugTableAktualisieren() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		List<Flug> direktfluege = null;
		if (request.getParameter("HinRueck").equals("Hin"))
			direktfluege = (List<Flug>) session.getAttribute("direktflug");
		else
			direktfluege = (List<Flug>) session.getAttribute("direktflugRueck");
		request.setAttribute("direktfluege", null);

		Enumeration<String> e = request.getParameterNames();

		double preisHin = Double.parseDouble((String) request.getParameter("preisHin"));
		Date uhrzeitHin = new Date(Long.parseLong((String) request.getParameter("uhrzeitHin")));
		Date flugdauerHin = new Date(Long.parseLong((String) request.getParameter("flugdauer")));

		ArrayList<Flug> flugList = new ArrayList<>();
		String[] gesellschaften = request.getParameter("ges").toString().split(",");
		System.out.println("direktfluege"+direktfluege.size());
		for (Flug flug : direktfluege) {

			if (flug.getPreis() <= preisHin && flug.getAbflugzeit().compareTo(uhrzeitHin) <= 0
					&& flug.getFlugdauer().compareTo(flugdauerHin) <= 0) {
				boolean selectedGesellschaft = false;
				for (int i = 0; i < gesellschaften.length; i++) {

					if (gesellschaften[i].trim()
							.equals(flug.getFlugzeugtyp().getGesellschaft().getBezeichnung().trim()))
						selectedGesellschaft = true;

				}
				if (selectedGesellschaft) {
					flugList.add(flug);
				}
			}
		}

		String sort = request.getParameter("sortingHin");
		System.out.println("sorting" + sort);
		if (sort.equals("1")) {
			Collections.sort(flugList, ComparatorFlug.getComparatorPreis());

		} else if (sort.equals("2")) {
			Collections.sort(flugList, ComparatorFlug.getComparatorFlugdauer());
		} else {
			Collections.sort(flugList, ComparatorFlug.getComparatorAbflugzeit());
		}

		request.setAttribute("direktfluege", flugList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("html/FlugTable.jsp");
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
