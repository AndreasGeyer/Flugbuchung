package flugsuche.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import flugsuche.bean.Flughafen;

/**
 * Servlet implementation class Test
 */
@WebServlet(name = "Test2", urlPatterns = { "/Test2" })
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(lookup="jdbc/MyTestSQLPool")
	private DataSource ds;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }

    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		final PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html");
		out.println("<html><body>");

//		out.println("<p>"+haefen.size()+"</p>");
//		out.println("<table>");
//		for(Flughafen fh: haefen){
//			out.println("<tr>");
//			out.println("<td>" + fh.getId() + "</td>");
//			out.println("<td>" + fh.getOrt() + "</td>");
//			out.println("<td>" + fh.getKuerzel() + "</td>");
//			out.println("<td>" + fh.getZeitzone() + "</td>");
//			out.println("</tr>");
//			
//		}
		
	
		out.println("</table></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
