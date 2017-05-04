<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String pass=request.getParameter("pass");
if(pass.length()>8){
%>
<font color="green">Strong password</font>
<%
}
else if(pass.length()>=5 && pass.length()<=8){
%>
<font color="blue">Normal password</font>
<%
}
else{
	%>
	<font color="red">Weak password</font>
	<%
}

%>
</body>
</html>