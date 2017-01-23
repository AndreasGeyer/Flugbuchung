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
@WebServlet("/AngebotsBildLaden")
public class AngebotsBildLaden extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "jdbc/__default")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 * Autohr Bauer Jürgen
	 */
	public AngebotsBildLaden() {
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

		
		int id = Integer.parseInt(request.getParameter("angebotid"));
		
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("select bild from angebot where angebotid = ?");) {
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs!= null && rs.next() && rs.getBlob("bild")!=null && rs.getBlob("bild").length()!=0) {
					Blob bild = rs.getBlob("bild");
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
