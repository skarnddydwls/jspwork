<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>스크립트를 대체하는 액션태그</h1>
	<%-- <%!선언문: 변수, 메소드 %> --%>
	<jsp:declaration>
		int max(int x, int y){
			return x>y? x: y;
		}
	</jsp:declaration>
	<jsp:expression>
		max(3,5) 
	</jsp:expression>
	
	<jsp:scriptlet>
		int num=6; 
	</jsp:scriptlet>
	
	<jsp:expression>
		num 
	</jsp:expression>
</body>
</html>