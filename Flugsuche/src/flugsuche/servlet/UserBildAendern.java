package flugsuche.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

/**
 * Servlet implementation class UserBildAendern
 */
@WebServlet("/UserBildAendern")
@MultipartConfig(
		maxFileSize=1024*1024*5,
		maxRequestSize=1024*1024*5*5,
		location= "/tmp",
		fileSizeThreshold=1024*1024)
public class UserBildAendern extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBildAendern() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try (
			Connection con = ds.getConnection();
			PreparedStatement pstmt = con.prepareStatement("update kunde set nutzerbild = ? where kundeid = ?");
		){
			Part filepart = request.getPart("nutzerbild");
			ByteArrayOutputStream stream = new ByteArrayOutputStream();
			InputStream in = filepart.getInputStream();
			int j = 0;
			while((j = in.read()) != -1){
				stream.write(j);
			}
			byte[] bild =  stream.toByteArray();
			stream.flush();
			pstmt.setBytes(1, bild);
			Cookie cookies[] = request.getCookies();
			String id = "";
			for (int i = 0; i < cookies.length; i++) {
				Cookie c = cookies[i];
				if (c.getName().equals("kundenid")) {
					id = c.getValue();
				}
			}
			pstmt.setInt(2, Integer.parseInt(id));
			System.out.println(pstmt.executeUpdate());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		response.sendRedirect(request.getContextPath() + "/UserLaden");
		
		
	}

}
