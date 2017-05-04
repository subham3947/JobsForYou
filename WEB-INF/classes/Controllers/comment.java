package Controllers;
import java.sql.*;
import java.util.Date;

import connection.connector;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class comment
 */
@WebServlet("/comment")
public class comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		try{
			String mess;
		Connection conn=connector.connect();
		String eid=request.getParameter("eid");
		String pass=request.getParameter("passw");
		String sql="select * from details where eid=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, eid);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			String ename=rs.getString(2);
			String chkpass=rs.getString(4);
			if(chkpass.equals(pass))
			{
				try{
					Date dt=new Date();
					String date=dt.toString();
					String comment=request.getParameter("cmmnt");
					System.out.println(comment);
					String sql1="insert into FEEDBACK values(?,?,?) ";
					PreparedStatement st=conn.prepareStatement(sql1);
					st.setString(1, ename);
					st.setString(2, date);
					st.setString(3, comment);
					st.executeUpdate();
					RequestDispatcher rd=request.getRequestDispatcher("feedback.jsp");
					request.setAttribute("mess","Comment posted.");
					rd.forward(request, response);
				}catch(Exception e)
				{
					System.out.print("Unable to insert comment");
				}
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("feedback.jsp");
				request.setAttribute("mess","Invalid Employee Id or Password.");
				rd.forward(request, response);
			}
			
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("feedback.jsp");
			request.setAttribute("mess","Please register first.");
			rd.forward(request, response);
		}
		}catch(Exception e){
			
		}
	}

}
