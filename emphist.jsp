<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.header{
background-image: url("bg.jpg");
font-family: Verdana;
color: white;
position: fixed;
top: 0;
left: 0;
width: 100%;
z-index: 99999;
border-radius: 10px;
background-repeat: no repeat;
}
.logo{
width: 120px;
border-radius: 20px;
float: left;
padding-bottom: 15px;
padding-left: 5px;
padding-top: 10px;
}
img{
float: left;
padding-left: 5px;
padding-top: 5px;
}
.emp{
width: 100%;
border: 1px solid black;
height: 150px;
border-radius:10px;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333333;
}
li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 16px;
    text-decoration: none;
}
li a:hover {
    background-color: #111111;
}
table{
font-size: 20px;
text-align: left;
margin-left: 30%;}
td{
padding: 10px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employment History</title>
</head>
<%@page import ="java.sql.*,connection.*" %>
<body>
<div class="header">
 <img class="logo" src="eoi.png">
<center><h1><u>Jobs For You</u></h1>
<p style="font-size: 10px;">The National Rural Employment Guarantee Act 2005</p>
<p style="font-size: 10px;">An initiative of Ministry of Rural Development.</p>
<p style="font-size: 10px;"> Government of India. </p></center>
<ul>
<li><a href="index.jsp">Home</a></li>
<li><a href="jobs.html">Jobs</a></li>
<li><a href="employers.jsp">Employers</a></li>
<li><a href="rajaswa.pdf">The Act</a></li>
<li><a href="faqs.html">FAQs</a></li>
<li><a href="http://rural.nic.in/">Ministry</a></li>
<li><a href="emphist.jsp">Employment History</a></li>
<li><a href="feedback.jsp">Feedback</a></li>
</ul>
</div><br><br><br><br><br><br><br><br><br><br>
<center><h2><u>Employment History</u></h2></center>
<%
try{
Connection con=connector.connect();
String sql="select * from history";
PreparedStatement st=con.prepareStatement(sql);
ResultSet rs=st.executeQuery();
while(rs.next())
	
{
	%>
	<div class="emp">
<img alt="<%=rs.getString(7) %>" src="<%=rs.getString(7) %>" height="140" width="120">
<table>
<tr><td>Employee Name: </td><td><%=rs.getString(1)%></td><td>Contact No.</td><td><%=rs.getString(4)%></td></tr>
<tr><td>Employed At:</td><td><%=rs.getString(2)%></td><td>Email Id:</td><td><%=rs.getString(5)%></td></tr>
<tr><td>Date Of Joining:</td><td><%=rs.getString(3)%></td><td>Location:</td><td><%=rs.getString(6)%></td></tr>
</table>
<br>
</div>
	<%
}
}catch(Exception e){
	System.out.println("Exception Occurred!!!");
}
%>
</body>
</html>