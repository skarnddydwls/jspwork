<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem" class="oracleDB.MemberPool"/>
<%
	String id= request.getParameter("id");
	String name= request.getParameter("name");
	
	if(mem.loginMem(id, name)){
		session.setAttribute("idkey", id);
%>
	<script type= "text/javascript">
		alert("로그인 되었습니다");
		location.href="05.3.sessionLoginOK.jsp";
	</script>
<% 
	} else {
	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>