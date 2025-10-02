<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name = request.getParameter("name");
	String studentNum= request.getParameter("studentNum");
	String gender= request.getParameter("gender");
	String major= request.getParameter("major");
	String[] hobby= request.getParameterValues("hobby");
	
	if(gender.equals("M")){
		gender = "남자"; 
	}
	else{
		gender = "여자"; 
	}
%>
</head>
<body>
	이름: <%=name %> <br>
	학번: <%=studentNum %> <br>
	성별: <%=gender %> <br>
	학과: <%=major %> <br>
	취미: 
	<% 
	for(int i=0;i<hobby.length;i++){
		if(i!=hobby.length-1) out.print(hobby[i]+", ");
		else out.print(hobby[i]);
	}
	%>
</body>
</html>