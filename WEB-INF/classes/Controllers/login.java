package Controllers;
import connection.*;

import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		con=connector.connect();
		String mess="";
		String eid=request.getParameter("eid");
		String pass=request.getParameter("pass");
		String sql="select password from DETAILS where eid=?";
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1, eid);
		ResultSet rs=st.executeQuery();
		if(rs.next())
		{
			if(pass.equals(rs.getString(1)))
			{
				HttpSession ses=request.getSession();
				ses.setAttribute("eid", eid);
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				request.setAttribute("mess","Invalid Employee Id or Password.");
				rd.forward(request, response);
			}
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			request.setAttribute("mess","Please register first if not yet registered.");
			rd.forward(request, response);
		}
		
		
	}catch(Exception e)
		{
		e.printStackTrace();
		}
	}

}
