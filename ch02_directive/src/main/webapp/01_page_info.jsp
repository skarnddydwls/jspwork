<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="JSP의 page지시자 연습"%>
<%@ page import="java.util.Date" 
		 buffer="16kb"
		 session="false"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>이 페이지의 info</p>
	<%=this.getServletInfo()%>
	<%
	Date date = new Date();
	%>
	<p>현재의 날짜와 시간</p>
	<%=date %>
</body>
</html>