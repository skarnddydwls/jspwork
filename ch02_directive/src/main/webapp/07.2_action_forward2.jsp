<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name = request.getParameter("name");
	String blood = request.getParameter("bloodType");
%>
</head>
<body>
	<%String page1= blood+".jsp"; %>
	<jsp:forward page='<%=page1%>'/>
</body>
</html>