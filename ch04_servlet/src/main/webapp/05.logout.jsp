<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
int intervalTime = session.getMaxInactiveInterval();
String id = (String)session.getAttribute("idkey");
%>
</head>
<body>
	<%
	session.invalidate();
	%>
	<jsp:forward page="05.login.jsp"/>
</body>
</html>