<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Cookie cookie1 = new Cookie("Name","남궁용진");
	//response.addCookie(cookie1);
	//response.addCookie(new Cookie("Name","남궁용진"));
	//response.addCookie(new Cookie("Age","27"));
	//response.addCookie(new Cookie("Gender","Male"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookies 생성하기</title>
</head>
<body>
<form action="02.2.cookies.jsp">
	이름: <input name="name"><p/>
	나이: <input name="age"><p/>
	성별: <input name="gender"><p/>
	<button type="submit">확인</button>
</form>


<!-- 	쿠키생성<p/>
	쿠키 내용 <a href="02.2.cookies.jsp">클릭</a> -->
</body>
</html>