<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String name="남궁용진";
	int num=3;
	boolean bool=true;
	double douNum =3.14;
	//int age; 
	//String str;  지역변수는 반드시 초기화 후 사용
	%>
	
	내 이름은 <%=name %>이고, <br>
	<%=num %>학년 입니다 <br>
	재학중 입니까?? <%=bool %> <br>
	원주율은 <%=douNum %> 입니다 <br>
	 
	<%-- 지역변수는 반드시 초기화 후 사용
	<%=age %> <br>
	<%=str %> <br> 
	--%>
	<%=application.getRealPath("/") %>
</body>
</html>