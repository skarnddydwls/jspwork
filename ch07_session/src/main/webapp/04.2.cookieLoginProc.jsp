<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem" class="oracleDB.MemberPool"/>
<%
	String id = request.getParameter("id");
	String name= request.getParameter("name");
	
	//boolean flag = mem.loginMem(id, name);
	if(mem.loginMem(id, name)) {
		Cookie cookie = new Cookie("idkey", id);
		response.addCookie(cookie);
%>
	<script type="text/javascript">
		alert("로그인에 성공하였습니다");
		location.href="04.3.cookieLoginOK.jsp";
	</script>
<% 
	} else {
%>
	<script type="text/javascript">
		alert("로그인에 실패하였습니다");
		location.href="04.1.cookieLogin.jsp";
	</script>
<% 
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
%>
</body>
</html>