<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String season = request.getParameter("season");
String fruit = request.getParameter("fruit");

String id = (String)session.getAttribute("idkey");
String sessionId = session.getId();
int intervalTime = session.getMaxInactiveInterval();
%>
</head>
<body>
<%
	if(id != null) {
%>
	<h1>Session Ex</h1>
	<%=id %>님이 좋아하는 계절과 과일은 <%=season %>과 <%=fruit %>이다 <p/>
	session Id: <%=sessionId %><p/>
	세션 유지시간: <%=intervalTime %>초
<% 
	}else {
		out.print("세션 시간이 경과하였거나 다른 이유로 연결할 수 없습니다");
	}
%>
</body>
</html>