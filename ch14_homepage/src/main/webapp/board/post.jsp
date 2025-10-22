<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.Board" />
<%
	
	Board sessionBoard = (Board)session.getAttribute("temp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<form action="boardPost" method="post">
		<table border="1" width="700px">
			<tr>
				<td colspan="2" align="center" height="auto">글쓰기</td>
			</tr>
			<tr>
				<td>성명</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				<textarea name="content" style="width:100%; height:500px; box-sizing: border-box;"></textarea>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			<tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로" onClick="location.href='list.jsp'">
				</td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
	</form>
</body>
</html>