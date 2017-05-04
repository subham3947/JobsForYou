<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import ="java.sql.*,connection.*" %>
<head>
<style type="text/css">
body{
background-image:url("bg2.jpg");
}
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
img{
width: 120px;
border-radius: 20px;
float: left;
padding-bottom: 15px;
padding-left: 5px;
padding-top: 10px;
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
#left
{
float:left;
width: 45%;
text-align: center;
border-right: 1px solid black;
font-size: 15px;
margin-left: 5%;
}
#right{
margin-right: 13%;
width: 30%;
text-align: center;
font-size: 15px;
float: right;
}
table{
margin-left: 25%;
}
textarea{
background-color:#39a3c6;

}
#butt1{
background-color: #4CAF50;
font-size: 25px;
width: 250px;
border: none;
color: #fff;
border-radius: 5px;
text-align: center;
cursor: pointer;

}
<%
	String msg=" ";
    try{
        msg=request.getAttribute("mess").toString();
        if(msg==null) {
            msg=" ";
        }
       
    }catch(Exception e){
        out.print(e.getMessage());
    }
    
%>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback</title>
</head>
<body>
<div class="header">
 <img src="eoi.png">
<center><h1><u>Jobs For You</u></h1>
<p style="font-size: 10px;">The National Rural Employment Guarantee Act 2005</p>
<p style="font-size: 10px;">An initiative of Ministry of Rural Development.</p>
<p style="font-size: 10px;"> Government of India.</p></center>
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
</div><br><br><br><br><br><br><br><br><br><br><br>
<h2><center><U><strong>Feedback</strong></U></center></h2><hr>
<%
Connection con=connector.connect();
String sql="select * from feedback";
PreparedStatement ps1=con.prepareStatement(sql);
ResultSet rs=ps1.executeQuery();
%>
<div id="left">
<b>Feedback by the employees:</b><br><br>
<textarea rows="13" cols="50" wrap="hard" placeholder="Comments:" ><% while(rs.next()){ %><%= rs.getString(1) %> <%= rs.getString(2) %>: <%= rs.getString(3) %>&#13;&#10;<%} %></textarea>
</div>
<div id="right"><b>Submit your feedback here:</b><br><br>
<form name="comment" action="comment" method="post">
<table>
<tr><td>Enter Employee Id:</td><td><input type="text" name="eid"></td></tr>
<tr><td>Password:</td><td><input type="password" name="passw"></td></tr>
</table>
<textarea rows="7" name="cmmnt" cols="50" placeholder="Comment Here:"></textarea><br>
<input type="Submit" value="Post" id="butt1">
</form>
<h4><%=msg %></h4>
</div>

</body>
</html>