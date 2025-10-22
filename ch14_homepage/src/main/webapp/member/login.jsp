<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id= (String)session.getAttribute("idkey");
	if(id != null){
%>
	<b><%=id %>님 ㅎㅇ요</b><p/>
	<a href= "logout.jsp">로그아웃</a>
<%		
	} else {
%>
	<form action="LoginProc.jsp" method="post">
		<table align="center">
			<tr>
				<th colspan="2">로그인</th>
			</tr>
			<tr>
				<td>ID</td>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input name="pw" type="password" required></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
					<input type="submit" value="로그인">&emsp;
					<input type="button" value="회원가입" onclick="location.href='member.jsp'">&emsp;
					<input type="button" value="홈으로" onclick="location.href='../index.jsp'">&emsp;
				</th> 
		</table>
	</form>
<%} %>
</body>
</html>