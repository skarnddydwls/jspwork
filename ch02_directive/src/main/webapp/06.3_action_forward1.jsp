<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id= request.getParameter("id");
	String pw= request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Action Forward Ex1</h1>
	ID: <%=id %> <br> <p/>
	PW: <%=pw %> <br> <p/>
</body>
</html>