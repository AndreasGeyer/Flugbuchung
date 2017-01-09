package flugsuche.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.sun.glass.ui.GestureSupport;

import flugsuche.bean.Kunde;

/**
 * Servlet implementation class UserBildLaden
 */
@WebServlet("/UserBildLaden")
public class UserBildLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserBildLaden() {
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
		int id = 0;
		Cookie cookies[] = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			Cookie c = cookies[i];
			if (c.getName().equals("kundenid")) {
				id = Integer.parseInt(c.getValue());
			}
		}
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("select nutzerbild from kunde where kundeid = ?");) {
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs!= null && rs.next() && rs.getBlob("nutzerbild")!=null && rs.getBlob("nutzerbild").length()!=0) {
					Blob bild = rs.getBlob("nutzerbild");
					response.reset();
					long length = bild.length();
					response.setHeader("Content-Length", String.valueOf(length));
					try(InputStream in = bild.getBinaryStream();){
						final int bufferSize = 250;
						byte[] buffer = new byte[bufferSize];
						
						ServletOutputStream out = response.getOutputStream();
						while((length = in.read(buffer))!= -1){
							out.write(buffer,0,(int)length);
						}
						out.flush();
					}
				}else{

//					File file = new File(request.getContextPath()+"/WebContent/img/user.jpg");
//					try(InputStream in = new FileInputStream(file)){
					try(InputStream in = getServletContext().getResourceAsStream("/img/user.jpg")){
						final int bufferSize = 250;
						byte[] buffer = new byte[bufferSize];
						
						ServletOutputStream out = response.getOutputStream();
						while(in.read(buffer)!= -1){
							out.write(buffer);
						}
						
						out.flush();
					}
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
