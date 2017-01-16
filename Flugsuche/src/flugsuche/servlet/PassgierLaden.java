package flugsuche.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xalan.internal.xsltc.runtime.Parameter;

import flugsuche.bean.Buchung;
import flugsuche.bean.Buchungsposition;
import flugsuche.bean.Flug;
import flugsuche.bean.Zusatzleistung;

/**
 * Servlet implementation class PassgierLaden
 */
@WebServlet("/PassgierLaden")
public class PassgierLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		
		HttpSession session = request.getSession();
		Buchung buchung = (Buchung) session.getAttribute("Buchung");
		
		System.out.println("fuckgeladen"+buchung.toString());
				
		response.sendRedirect(request.getContextPath()+"/Flugbuchung");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
