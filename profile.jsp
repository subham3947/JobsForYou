<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Profile</title>
<style type="text/css">
body{
background-image: url("bg1.jpg");
}
.header{
background-image: url("bg.jpg");
font-family: Verdana;
color: white;
position: fixed;
text-align: center;
top: 0;
left: 0;
width: 100%;
z-index: 99999;
border-radius: 10px;
background-repeat: no repeat;
}
img{
width: 120px;
border-radius: 20px;
float: left;
padding-bottom: 15px;
padding-left: 5px;
padding-top: 10px;
height: 130px;
}
#pic{
margin-right: 10%;
float:right;
}
#details{
font-size: 20px;
background: white;
border-radius: 10px;
width: 100%;
}
#butt{
height: 50px;
float: right;
background-color: #f90606;
font-size: 15px;
border: none;
color: #fff;
border-radius: 5px;
text-align: center;
cursor: pointer;
width: 100px;
}
table{
text-align: inherit;
padding: 20px;
margin-left: 20%;
}
p{
text-align: center;
}
</style>
</head>
 <%@page import ="java.sql.*,connection.*" %>
<body>
<div class="header">
 <img src="eoi.png">
<center><h1><u>Jobs For You</u></h1>
<p style="font-size: 10px;">The National Rural Employment Guarantee Act 2005</p>
<p style="font-size: 10px;">An initiative of Ministry of Rural Development.</p>
<p style="font-size: 10px;"> Government of India.</p></center>
</div><br><br><br><br><br><br><br>
<h2><center><u>Profile</u></center></h2>
<%
try{
Connection con=connector.connect();
request.getSession();
String eid=(String)session.getAttribute("eid");
String sql="select * from DETAILS where eid=?";
PreparedStatement st=con.prepareStatement(sql);
st.setString(1, eid);
ResultSet rs=st.executeQuery();
while(rs.next())
{
%>

<div id="details">
<form action="logout" name="logout"><input type="Submit" value="Log Out" id="butt" ></form>
<div id = "pic">
<img src = "<%=rs.getString(11)%>" width = "100px" height = "100px" alt = "not showing"></div>
<table>
<tr><td>Name:</td><td><%=rs.getString(2) %></td></tr>
<tr><td>Email:</td><td><%=rs.getString(3) %></td></tr>
<tr><td>Date Of Birth:</td><td><%=rs.getString(5)%></td></tr>
<tr><td>Gender</td><td><%=rs.getString(6) %></td></tr>
<tr><td>Mobile Phone:</td><td><%=rs.getString(7)%></td></tr>
<tr><td>Location:</td><td><%=rs.getString(8)%></td></tr>
<tr><td>Skills(if any):</td><td><%=rs.getString(9) %></td></tr>
<tr><td>Government Identification No.:</td><td><%=rs.getString(10)%></td></tr>
<tr><td>Date of Registration:</td><td><%=rs.getString(14)%></td></tr>
<tr><td>Employment Status:</td><td><%=rs.getString(15)%></td></tr>
<tr><td>Job Allotment Due Date:</td><td><%=rs.getString(16)%></td></tr>
</table>
<p>At Jobs For You,we are committed to bring you the jobs that are best suited for you according to your qualification or your skills. As soon as we find a suitable job opportunity for you, our team will immediately contact you via email and you will be guided through the whole recruitment process.  </p>
</div>

<%
}
}
catch(Exception e)
{
	System.out.println("SQL Error");
}
%>

</body>
</html>