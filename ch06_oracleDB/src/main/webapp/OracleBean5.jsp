<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, oracleDB.*" %>
<jsp:useBean id="empMgr" class="oracleDB.EmployeePool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Bean을 이용한 oracle 연동</h1>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>이메일</th>
			<th>부서코드</th>
			<th>직급코드</th>
			<th>급여</th>
		</tr>
<%
	ArrayList<EmployeeBean> alist = empMgr.getEmplist();

	for(int i=0;i<alist.size();i++){
		 EmployeeBean bean=alist.get(i);
%>
	<tr>
		<td><%=bean.getEmp_id() %></td>
		<td><%=bean.getEmp_name() %></td>
		<td><%=bean.getEmail() %></td>
		<td><%=bean.getDept_code() %></td>
		<td><%=bean.getJob_code() %></td>
		<td><%=bean.getSalary() %></td>
	</tr>	 
<% 
	}
%>
	</table>
</body>
</html>