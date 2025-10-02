<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name= request.getParameter("name");
	String blood= request.getParameter("bloodType");
%>
</head>
<body>
	<b>
	이름: <%=name %>, 혈액형 <%=blood %> <br><br>
	
	<%=blood %>형은 소심하더라
	</b>
</body>
</html>