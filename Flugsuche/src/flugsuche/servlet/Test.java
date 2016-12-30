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
	
	@Resource(lookup="jdbc/__default")
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
		final PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<body>");
		try {
			// ds = (DataSource) InitialContext.doLookup("jdbc/MySQLPool");
			final Connection con = ds.getConnection();
			if (con.isValid(10))
				out.println("<BR>Connected via @Resource!");
			con.close();
		} catch (Exception ex) {
			out.println(ex.getMessage()+"\n");
			ex.printStackTrace(out);
		}
		out.println("</body></html>");
		
	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
