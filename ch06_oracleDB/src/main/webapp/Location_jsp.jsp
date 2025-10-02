<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, oracleDB.*" %>
<jsp:useBean id="location" class="oracleDB.LocationMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>Local_Code</th>
			<th>National_Code</th>
			<th>Local_Name</th>
		</tr>
<%
	ArrayList<LocationBean> alist = location.getLocalist();

	for(int i=0;i<alist.size();i++){
		 LocationBean bean=alist.get(i);
%>
	<tr>
		<td><%=bean.getLocation_code() %></td>
		<td><%=bean.getNational_code() %></td>
		<td><%=bean.getLocal_name() %></td>
	</tr>	 
<% 
	}
%>
	</table>
</body>
</html>