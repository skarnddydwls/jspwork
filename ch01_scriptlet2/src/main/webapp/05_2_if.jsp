<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String msg;
	if(color.equals("blue")) {
		msg = "파란색";
	}else if (color.equals("red")){
		msg = "빨간색";
	}else if(color.equals("yellow")){
		msg = "노란색";
	}else {
		msg="기타";
		color="green";
	}
%>
</head>
<body bgcolor=<%=color %>>
	<%=name%>씨가 좋아하는 색상은 <b><%=msg %> 입니다</b><br>
	<%=color %>
	
</body>
</html>