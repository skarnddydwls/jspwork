<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao"/>
<%
	String keyWord ="", keyField="";
	if(request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	ArrayList<Board> list = bDao.getBoardList(keyField, keyWord);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3 align="center">JSP Board</h3>
	<p>Total: </p>
	<table border="1">
		<tr>
			<th width="5%">번호</th>
			<th width="40%">제목</th>
			<th width="15%">이름</th>
			<th width="20%">날짜</th>
			<th width="10%">조회수</th>
		</tr>
			<%
			if(list != null && !list.isEmpty()){
				for(int i=0;i<list.size();i++){
					Board b = list.get(i);
					int num = b.getNum();
					String content = b.getContent();
					String name = b.getName();
					String date = b.getRegdate().substring(0,10);
					
					out.print("<tr><td>"+num+"</td>");
					out.print("<td>"+content+"</td>");
					out.print("<td>"+name+"</td>");
					out.print("<td>"+date+"</td>");
					out.print("<td>"+b.getCount()+"</td></tr>");			
				}
			}
			%>
	</table>
	<form action="list.jsp" name="searchFrm">
		<select name="keyField">
			<option value = "name">이름</option>
			<option value = "subject">제목</option>
			<option value = "content">내용</option>
		</select>
		<input name="keyWord" requird>
		<input type="submit" value="찾기">
	</form>
</body>
</html>














