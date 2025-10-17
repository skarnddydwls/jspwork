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
	String id= request.getParameter("id");	
	String pw= request.getParameter("pw");
	String msg= "로그인에 실패했습니다";
	
	if(mDao.loginMember(id, pw)){ // 반환값 boolean
		session.setAttribute("idkey",id);
		msg= "로그인에 성공했습니다";
	} 
%>
<script>
	alert("<%=msg%>");
	location.href="../index.jsp";
</script>
</body>
</html>