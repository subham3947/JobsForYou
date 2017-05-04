package Controllers;
import connection.*;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,maxFileSize = 1024*1024*10,maxRequestSize = 1024*1024*50)
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "Details";
	private Connection con;
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		con=connector.connect();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String dob=request.getParameter("dob");
		String gen=request.getParameter("gender");
		String mob=request.getParameter("mob");
		String loc=request.getParameter("loc");
		String skill=request.getParameter("skill");
		String gidn=request.getParameter("gidn");
		String picPath=null;
		String gidPath=null;
		String cvPath = null;
		try{
			String filepath="D:"+File.separator+SAVE_DIR;
			File directory=new File(filepath);
			if(!directory.exists())
				directory.mkdir();
			Part part=request.getPart("cv");
			String path=extractPath(part);
			String filename = path.substring(path.lastIndexOf("\\")+1,path.length());
		    cvPath = filepath+File.separator+filename;
		    part.write(cvPath);
			Part part1=request.getPart("pic");
			String path1=extractPath(part1);
			String filename1 = path1.substring(path1.lastIndexOf("\\")+1,path1.length());
		    picPath = filepath+File.separator+filename1;
			part1.write(picPath);
			Part part2=request.getPart("gid");
			String path2=extractPath(part2);
			String filename2 = path2.substring(path2.lastIndexOf("\\")+1,path2.length());
		    gidPath = filepath+File.separator+filename2;
			part2.write(gidPath);
			//generating id
			String eid="E"+((int)(Math.random()*100000));
			Date date=new Date();
			DateFormat outputFormatter = new SimpleDateFormat("dd/MM/yyyy");
			String dt = outputFormatter.format(date);
			//writing to database
			String sql="insert into DETAILS values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, eid);st.setString(2, name);st.setString(3, email);st.setString(4, pass);
			st.setString(5,dob);st.setString(6, gen);st.setString(7, mob);st.setString(8, loc);
			st.setString(9, skill);st.setString(10, gidn);st.setString(11, picPath);st.setString(12, gidPath);
			st.setString(13, cvPath);st.setString(14, dt);st.setString(15, " ");st.setString(16, " ");
			st.execute();
			System.out.print(dt);
			String mess="Your ID is "+eid+".Please login to view your profile.";
			request.setAttribute("mess", "<font-color: blue>Your ID is "+eid+". Please login to view your profile.</font>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}catch(Exception e)
		{
			request.setAttribute("mess", "<font-color: red>Error!Please try again.</font>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
			e.printStackTrace();
		}
	}
	private String extractPath(Part part){
		String Content_dis = part.getHeader("Content-Disposition");
		String[] items = Content_dis.split(";");
		for(String x : items){
			if(x.trim().startsWith("filename")){
				return x.substring(x.indexOf("=")+2,x.length()-1);
			}
		}
		return null;
	}

}
