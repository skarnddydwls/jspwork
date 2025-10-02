<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name="Korea web JSP"; /* request.getParameter("name") */
%>
</head>
<body>
	<h1>Action Include Tag</h1>
	<jsp:include page="04.3_action_include1.jsp"></jsp:include>
	action include Tag의 첫번째 페이지 <br>
	<%=name %>
</body>
</html>