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
	if(id != null) {
%>
	<script type="text/javascript">
		alert("로그인 되었습니다");
		location.href="05.3.sessionLoginOK.jsp";
	</script>
<% 
		
	} else {
%>
	<h1>Session Login</h1>
	
	<form action= "05.2.sessionLoginProc.jsp" method="post">
		<table border="1">
			<tr>
				<th colspan="2">Login</th>
			</tr>
			<tr>
				<th>ID</th>
				<td><input name="id" required></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input name="name" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
					<input type="reset">
				</td>
			</tr>
		</table>
	</form>
<%} %>
</body>
</html>