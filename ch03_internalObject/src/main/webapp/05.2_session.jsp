<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String id=request.getParameter("id");
String pw=request.getParameter("pw");

session.setAttribute("idkey",id);
session.setMaxInactiveInterval(1);
%>
</head>
<body>
	<h1>Session Ex</h1>
	<form action="05.3_session.jsp">
	1. 가장 좋아하는 계절은? <p/>
	<input type="radio" name="season" value="봄">봄&emsp;
	<input type="radio" name="season" value="여름">여름&emsp;
	<input type="radio" name="season" value="가을">가을&emsp;
	<input type="radio" name="season" value="겨울">겨울&emsp;<br>
	
	2. 가장 좋아하는 과일은? <p/>
	<input type="radio" name="fruit" value="사과">사과&emsp;
	<input type="radio" name="fruit" value="배">배&emsp;
	<input type="radio" name="fruit" value="체리">체리&emsp;
	<input type="radio" name="fruit" value="감">감&emsp;<br>
	<input type="submit">&emsp; <input type="reset">
	</form>
</body>
</html>