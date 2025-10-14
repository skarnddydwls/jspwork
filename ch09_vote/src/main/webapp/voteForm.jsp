<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vote.*, java.util.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao"/>
<%
	int num = 0;
	if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	
	Votelist vlist = vDao.getVote(num);
	ArrayList<String> vitem = vDao.getItem(num);
	
	String question = vlist.getQuestion();
	int type = vlist.getType();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form class="from" action="voteFormProc.jsp">
		<table align="center" border="1" width="500px">
			<tr>
				<td colspan='2'>Q: <%=question %></td>
			</tr>
			<%
			for(int i=0;i<vitem.size();i++){
				String item = vitem.get(i);
				if(type == 0){
					out.print("<td colspan='2'><input type='radio' name='check'>"+item+"</td></tr>");
				} else {
					out.print("<tr><td colspan='2'><input type='checkbox' name='check'>"+item+"</td></tr>");
				}
			}
			%>
			<tr>
				<td align="center"><input type="submit" value="투표"></td>
				<td align="center"><input type="button" value="결과" 
				onclick="window.open('voteView.jsp?num=<%=num %>', 'voteView', 'width=500, height=300')"></td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num%>">
	</form>
	</div>
</body>
</html>