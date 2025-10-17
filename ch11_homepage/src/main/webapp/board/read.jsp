<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<!DOCTYPE html>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	Board board = null;
	Board sessionBoard = (Board)session.getAttribute("temp");
	if(sessionBoard == null || sessionBoard.getNum() != num){
		bDao.upCount(num);
		board = bDao.getBoard(num);
		session.setAttribute("temp", board); // Attribute가 뭔데 
	} else {
		board = bDao.getBoard(num);
		session.setAttribute("temp", board);
	}
%>
<script>
	function list(){
		document.listFrm.submit();
	}
</script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="700px">
		<tr><td colspan="4" align="center" height="auto"><h3>글 읽 기</h3></td></tr>
		<tr>
			<td width="10%">이름</td>
			<td><%=board.getName() %></td>
			<td width="10%">등록날짜</td>
			<td><%=board.getRegdate().substring(0,10) %></td>
		</tr>
		<tr>
			<td width="10%">제목</td>
			<td colspan="3"><%=board.getSubject() %>
		</tr>
		<tr>
			<td width="10%">첨부파일</td>
			<td colspan="3"><%=board.getFilename() %> (<%=board.getFilesize() %>)</td>
		</tr>
		<tr>
			<td height="500px" colspan="4"><%=board.getContent() %></td>
		</tr>
		<tr>
			<td align="right" colspan="4"><%=board.getIp() %> 로 부터 글을 남기셨습니다. / <%=board.getCount() %></td>
		</tr>
		<tr><td align="center" colspan="4">[ 
			<a href="javascript:list()">목록</a> |
			<a href="update.jsp?num=<%=num%>&nowPage=<%=nowPage%>">수정</a> |
			<a href="reply.jsp?nowPage=<%=nowPage%>">답변</a> |
			<a href="delete.jsp?num=<%=num%>&nowPage=<%=nowPage%>">삭제</a> ] 
		</td></tr>
	</table>
	<form action="list.jsp" name="listFrm">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<%
		if(!(keyWord == null || keyWord.equals(""))){
		%>
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">	
		<% 
		}
		%>
	</form>
</body>
</html>