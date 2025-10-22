<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, vote.*" %>
<jsp:useBean id="vDao" class="vote.VoteDao"/>
<%
	String str = request.getParameter("num");
	int num = 0;
	
	if (str != null && !str.isEmpty()){
		num = Integer.parseInt(str);
	}
	
	ArrayList<Voteitem> alist = vDao.getView(num);
	Votelist vlist = vDao.getVote(num);
	int sum = vDao.sumCount(num);
	
	Random r = new Random();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>item</th>
			<th>그래프</th>
			<th>득표수</th>
		</tr>
		<%
			for(int i=0; i<alist.size();i++){
				Voteitem vitem = alist.get(i);
				String[] item = vitem.getItem();
				int rgb = r.nextInt(255*255*255);
				String rgbHex = Integer.toHexString(rgb);
				String hRGB = "#"+rgbHex;
				
				int ratio = (int)(vitem.getCount()/ (double)sum*500);
		%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=item[0] %></td>
			<td>
				<table width="<%=ratio%>" height="15">
					<tr><td bgColor="<%=hRGB%>" align="left"></td></tr>
				</table>
			</td>
			<td><%=vitem.getCount() %></td>
		</tr>
		<%} // for문 괄호%> 
	</table>
</body>
</html>










