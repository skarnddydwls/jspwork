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
	<table align="center" border="1" width="500px">
		<tr>
			<%
				Votelist vlist1 = vDao.getVote(1);
				String question1 = vlist1.getQuestion();
				int type1 = vlist1.getType();
				out.print("<td colspan='2'>"+question1+"</td>");
			%>
		</tr>
		<%
		ArrayList<String> alist1 = new ArrayList<>();
		for(int i=2;i<7;i++){ // 번호 들어가는거 수정하기
			ArrayList<String> temp = vDao.getItem(i);
			alist1.addAll(temp);
		}
		for(int i=0;i<alist1.size();i++){
			if(type1 == 0){
				out.print("<tr><td colspan='2'><input type='radio' name='check'>"+alist1.get(i)+"</td></tr>");
			} else {
				out.print("<tr><td colspan='2'><input type='checkbox' name='check'>"+alist1.get(i)+"</td></tr>");
			}
		}
		%>
		<tr>
			<td align="center"><input type="button" onclick="location.href=''" value="투표"></td>
			<td align="center"><input type="button" onclick="location.href=''" value="결과"></td>
		</tr>
	</table>	
	
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
			out.print("<td align='center'><a href=''>"+question +"</a></td>");
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