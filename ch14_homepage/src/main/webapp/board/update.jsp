<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.Board" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	Board sessionBoard = (Board)session.getAttribute("temp");
	String name="";
	String subject="";
	String content="";
	String pass="";
	
	if(num == sessionBoard.getNum()){
		name = sessionBoard.getName();
		subject = sessionBoard.getSubject();
		content = sessionBoard.getContent();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardUpdate" method="post">
		<table border="1" width="700px">
			<tr>
				<td colspan="2" height="auto">수정하기</td>
			</tr>
			<tr>
				<td>성명</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" value="<%=subject %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td height="500px">
				<textarea name="content" style="width:100%; height:100%; box-sizing: border-box;"><%=content %></textarea>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			<tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정완료">&emsp;
					<input type="reset" value="다시수정">&emsp;
					<input type="button" value="뒤로" onClick="history.go(-1)">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>
</body>
</html>