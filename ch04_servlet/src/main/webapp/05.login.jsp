<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String id = (String)session.getAttribute("idkey");
String sessionId = session.getId();
%>
</head>
<body>
	<form action="LoginServlet" method="post">
	ID: <input name="id"><p/>
	PW: <input type="password" name="pw"><p/>
	<input type="submit">
	</form>
	
	<%
	if(id != null) {
		out.print(id+"님 반갑습니다");
	%> <br>
	"<a href="05.logout.jsp">로그아웃</a>"
	<% 
	}
	%>
	
</body>
</html>