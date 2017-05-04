<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body
{
background-image: url("bg7.jpg");

}
#Body{
background-color: #808080;
width:650px;
border-radius: 15px;
margin-left: 30%;
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
table{
padding: 10px;
}
#login{
float: left;
margin-left: 5%;
border-right: 1px solid black;
padding: 10px;
}
#butt1{
background-color: #6699ff;
font-size: 25px;
border: none;
color: #fff;
border-radius: 5px;
text-align: center;
cursor: pointer;
width: 250px;
}
#butt2{
background-color: #4CAF50;
font-size: 25px;
width: 250px;
border: none;
color: #fff;
border-radius: 5px;
text-align: center;
cursor: pointer;

}
#Sign{
padding: 25px;
margin-left: 45%;
}
.lcontainer
{
font-size-adjust: inherit;
font-style: Verdana;
font-size: 20px;
border-radius: 10px;
text-align: center;

}
.rcontainer{
background-color: #808080;
width: 200px;
}
h4{
margin-left: 40%;}
.tab {
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
#events
{
height: 150px;
float: left;
text-align: center;
 background-color: #b3b3b3;
 font-size: 20px;
 color: white;
 border-radius: 10px;
}
marquee{
color: red;}
<%
	String msg=" ";
    try{
        msg=request.getAttribute("mess").toString();
       
        if(msg==null) {
            msg=" ";
        }
        %><%
    }catch(Exception e){
        out.print(e.getMessage());
    }
%>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jobs For You</title>
</head>
<body>
 <div class="header">
 <img src="eoi.png">
<center><h1><u>Jobs For You</u></h1>
<p style="font-size: 10px;">The National Rural Employment Guarantee Act 2005</p>
<p style="font-size: 10px;">An initiative of Ministry of Rural Development.</p>
<p style="font-size: 10px;"> Government of India.</p></center>
<ul class="tab">
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
<marquee style="color: #DC143C;" scrolldelay="150"><strong>Quickly register to get noticed by the employers under NREGA!!</strong></marquee>
<br><br>
<div id="events">
<u>News & Events</u>
<center><marquee scrolldelay="150" direction="up"onmouseover="this.stop();" onmouseout="this.start();">
<a href="https://en.wikipedia.org/wiki/Poverty_alleviation_programmes_in_India">Poverty Alleviation Schemes</a><br><br>
<a href="https://eaadhaar.uidai.gov.in/">Aadhar Card registration</a><br><br>
<a href="http://rationcardgov.in/">Digitization of ration cards</a><br><br>
</marquee></center>
</div>
<div id="Body">
<div id="login">
<form action="login" name="log" method="post">
<table>
<tr><td>Enter your Id:</td><td><input type="text" name="eid" placeholder="Employee Id"></td></tr>
<tr><td>Password:</td><td><input type="password" name="pass" placeholder="Password" ></td></tr>
<tr><td colspan="2"><input type="Submit" value="Log In" id="butt1"></td></tr>
</table>
</form>
</div>
<div id="Sign">
<table>
<tr><td>Still not registered? Register Here!</td></tr>
<tr><td><form name="signup" action="register.html" method="POST"><input type="Submit" value="Sign Up" id="butt2" ></form></td></tr>
</table>
</div>
</div>
<h4><%=msg %></h4>
<br>
<div class="lcontainer">
<p><u>Portal for Jobs</u></p>
<p>Jobs for you is the ultimate place for the unemployed youth. A portal for the under-privileged in Rural areas where the rural youth should be able to access policies,opportunities pertaining to their areas and be guided through the employment process via the portal.  </p>
<p>The initiative is taken by The Ministry of Rural Development under the NREGA Act. Here the employed youth can register using any Government Identification and can easily get jobs for 100 days in their desired location.</p>
</div>
</body>
</html>