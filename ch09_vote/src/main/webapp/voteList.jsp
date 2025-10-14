<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vote.*, java.util.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">투표 프로그램</h1>
	<hr>
	<h3 align="center">설문폼</h3>
	<jsp:include page="voteForm.jsp"></jsp:include>
	<hr>
	<h3 align="center">설문리스트</h3>
	<table align="center" border="1" width="500px">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>시작일</th>
			<th>종료일</th>
		</tr>
		<%
		ArrayList<Votelist> alist = vDao.getList();
		for(int i=0;i<alist.size();i++){
			Votelist vlist = alist.get(i);
			int num= vlist.getNum();
			String question= vlist.getQuestion();
			String sdate= vlist.getSdate().substring(0,10);
			String edate= vlist.getEdate().substring(0,10);
			
			out.print("<tr><td align='center'>"+(alist.size()-i)+"</td>");
			out.print("<td align='center'><a href='voteList.jsp?num="+num+"'>"+question +"</a></td>");
			out.print("<td align='center'>"+ sdate +"</td>");
			out.print("<td align='center'>"+ edate +"</td></tr>");		
		}
		%>
		<tr>
			<td colspan="4" align="center"><a href="voteInsert.jsp">설문 작성하기</a></td>
		</tr>
	</table>
</body>
</html>