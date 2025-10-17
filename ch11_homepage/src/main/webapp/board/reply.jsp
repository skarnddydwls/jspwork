<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.Board" />
<%
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	Board board = (Board)session.getAttribute("temp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardReply" method="post">
		<table border="1" width="700px">
			<tr>
				<td colspan="2" height="auto">댓글등록</td>
			</tr>
			<tr>
				<td>성명</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input name="subject" value="답변: <%=board.getSubject() %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td height="500px">
				<textarea name="content" style="width:100%; height:100%; box-sizing: border-box;">
				</textarea>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			<tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="답변등록">&emsp;
					<input type="reset" value="다시쓰기">&emsp;
					<input type="button" value="뒤로" onClick="history.go(-1)">
				</td>
			</tr>
		</table>
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<!-- 나의 정보 -->
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		
		<!-- 부모의 정보 -->
		<input type="hidden" name="ref" value="<%=board.getRef() %>">
		<input type="hidden" name="pos" value="<%=board.getPos() %>">
		<input type="hidden" name="depth" value="<%=board.getDepth() %>">
	</form>
</body>
</html>