<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDao" class="member.MemberDao"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	boolean result = mDao.checkId(id);
	if(result) {
		out.print("아이디 "+id + "는 사용중입니다<p/>");
	} else {
		out.print("사용가능한 "+id+"입니다<p/>");
	}
%>
	<a href="" onclick="self.close()">닫기</a>
</body>
</html>