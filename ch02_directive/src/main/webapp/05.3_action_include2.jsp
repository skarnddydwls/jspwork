<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name = request.getParameter("siteName");
	String tel = request.getParameter("siteTel");
%>
</head>
<body>
	Action include로 포함되는 페이지<p/>
	<%=name %> <br>
	<%=tel %> <br><br>
</body>
</html>